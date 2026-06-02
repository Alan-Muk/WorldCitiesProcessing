Table table;

ArrayList<String> countries = new ArrayList<String>();
HashMap<String, Integer> countryIndex = new HashMap<String, Integer>();
HashMap<String, Integer> countryLeaderRow = new HashMap<String, Integer>();

int maxCities;

void setup() {
  size(1200, 600);
  table = loadTable("worldcities.csv", "header");

  maxCities = table.getRowCount();
  noStroke();
  textFont(createFont("Arial", 12));

  //  build country list + leader city per country
  for (int i = 0; i < maxCities; i++) {

    String c = table.getString(i, "country");
    if (c == null) continue;

    if (!countryIndex.containsKey(c)) {
      countryIndex.put(c, countries.size());
      countries.add(c);
    }

    float pop = table.getFloat(i, "population");
    if (Float.isNaN(pop)) continue;

    if (!countryLeaderRow.containsKey(c)) {
      countryLeaderRow.put(c, i);
    } else {
      int oldRow = countryLeaderRow.get(c);
      float oldPop = table.getFloat(oldRow, "population");

      if (pop > oldPop) {
        countryLeaderRow.put(c, i);
      }
    }
  }
}

void draw() {

  background(0);

  float t = frameCount * 0.1;

  int visibleCities = 0;

  for (int i = 0; i < maxCities; i++) {

    TableRow row = table.getRow(i);

    float lat = row.getFloat("lat");
    float lon = row.getFloat("lng");

    if (Float.isNaN(lat) || Float.isNaN(lon)) continue;

    float pop = row.getFloat("population");
    if (Float.isNaN(pop) || pop < 100000) continue;

    String country = row.getString("country");
    if (!countryIndex.containsKey(country)) continue;

    int cIndex = countryIndex.get(country);

    //  country timing
    float countryStart = cIndex * 12.0;
    float countryT = t - countryStart;

    if (countryT < 0) continue;

    //  city timing
    float appearTime = (i % 200) * 0.1;
    if (countryT < appearTime) continue;

    float fade = constrain((countryT - appearTime) / 8.0, 0, 1);

    float x = map(lon, -180, 180, 0, width);
    float y = map(lat, 90, -90, 0, height);

    //  fixed size mapping
    float size = map(log(pop), log(100000), log(20000000), 1, 3);
    size = constrain(size, 1, 4);

    boolean isLeader = (countryLeaderRow.get(country) == i);

    //  capital detection
    String capitalType = row.getString("capital");
    boolean isCapital = "primary".equals(capitalType);

    //  normal city
    if (!isLeader || countryT < 8.0) {
      fill(255, 255 * fade);
      ellipse(x, y, size, size);
    }

    //  leader + wave
    if (isLeader && countryT > 8.0) {

      float waveTime = countryT - 8.0;

      fill(255, 60, 60, 255 * fade);
      ellipse(x, y, size + 2, size + 2);

      //  ripple layering
      for (int k = 0; k < 3; k++) {
        drawWave(x, y, waveTime - k * 1.5);
      }
    }

    //  capital label (fade in + fade out)
    float labelDelay = 2.0;
    float labelDuration = 6.0;

    float labelTime = countryT - appearTime - labelDelay;

    if (isCapital && labelTime > 0 && labelTime < labelDuration) {

      String cityName = row.getString("city");

      float fadeIn = constrain(labelTime / 2.0, 0, 1);
      float fadeOut = constrain((labelDuration - labelTime) / 2.0, 0, 1);
      float labelFade = fadeIn * fadeOut;

      //  upward drift
      float yOffset = map(labelTime, 0, labelDuration, 0, -10);

      //  glow pass
      fill(100, 200, 255, 60 * labelFade);
      textAlign(CENTER, BOTTOM);
      textSize(12);
      text(cityName, x + 1, y - 4 + yOffset);

      //  main text
      fill(100, 200, 255, 220 * labelFade);
      textSize(10 + 4 * (1 - fadeIn));
      text(cityName, x, y - 5 + yOffset);
    }

    visibleCities++;
  }

  //  HUD
  fill(255);
  textSize(14);
  textAlign(LEFT, BOTTOM);
  text("Visible cities: " + visibleCities, 10, height - 10);

  int activeCountry = min(floor(t / 8.0), countries.size() - 1);
  fill(255, 200);
  text("Active country: " + countries.get(activeCountry), 10, height - 30);
}

void drawWave(float lx, float ly, float waveTime) {

  if (waveTime < 0) return;

  float waveSpeed = 1.0;
  float r = waveTime * waveSpeed * 60.0;

  float maxRadius = 100;
  if (r > maxRadius) return;

  // 🌫 fade over time
  float timeFade = exp(-waveTime * 0.15);

  // 🌫 fade over distance
  float radiusFade = map(r, 0, maxRadius, 1.0, 0.0);
  radiusFade = constrain(radiusFade, 0, 1);

  float fade = timeFade * radiusFade;

  // 🌫 soft edge fade
  float edgeFade = smoothstep(maxRadius * 0.7, maxRadius, r);
  fade *= (1.0 - edgeFade);

  //  distortion fades out too
  float distortion = 18.0 * fade;

  stroke(255, 80, 80, 120 * fade);
  strokeWeight(1);
  noFill();

  int steps = 90;

  beginShape();

  for (int j = 0; j <= steps; j++) {

    float angle = map(j, 0, steps, 0, TWO_PI);

    float n = noise(
      cos(angle) * 2.0 + 10,
      sin(angle) * 2.0 + 10,
      waveTime * 0.4
    );

    float offset = map(n, 0, 1, -distortion, distortion);
    float rr = r + offset;

    float x = lx + cos(angle) * rr;
    float y = ly + sin(angle) * rr;

    //  horizontal wrap
    if (x < 0) x += width;
    if (x > width) x -= width;

    vertex(x, y);
  }

  endShape(CLOSE);

  noStroke();
}

//  smooth transition helper
float smoothstep(float edge0, float edge1, float x) {
  float t = constrain((x - edge0) / (edge1 - edge0), 0, 1);
  return t * t * (3 - 2 * t);
}

/*
PROGRAM DESCRIPTION

This program visualises cities from a world cities dataset on a world map.
The CSV file is loaded and processed to identify all countries, their cities,
and the largest city within each country.

The animation reveals countries one at a time. Cities appear gradually based
on timing values calculated from the country's position in the dataset. City
markers are drawn according to their population, with larger populations
producing slightly larger markers.

The largest city in each country is highlighted in red and generates animated
ripple waves that expand outward. These waves use Perlin noise to create an
organic, irregular shape and gradually fade as they grow.

National capitals are detected using the "capital" field in the dataset.
Their names appear as animated labels that fade in, drift upward, and fade out
over time.

The drawWave() function creates the ripple effect around leader cities by
drawing expanding distorted circles. The smoothstep() function is used to
create smooth fading transitions near the edge of each wave.

A heads-up display (HUD) is shown in the bottom-left corner of the screen,
displaying the number of visible cities and the currently active country in
the animation sequence.
*/
