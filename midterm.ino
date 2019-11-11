void setup() {
  // initialize the serial communications:
  Serial.begin(9600);
  pinMode(8, OUTPUT);
  digitalWrite(8, LOW);
  digitalWrite(8, HIGH);
}

void loop() {
  // print the sensor values:
//  Serial.print(analogRead(A0));
  Serial.print(int(map(analogRead(A0), 260, 400, 200, 900)));
  // print a tab between values:
  Serial.print("&");
  Serial.print(int(map(analogRead(A1), 260, 400, 200, 900)));
//Serial.print(analogRead(A1));
  // print a tab between values:
  Serial.print("&");
  Serial.print(int(map(analogRead(A2), 260, 400, 200, 900)));
//  Serial.print(int(map(analogRead(A2)));
  Serial.println();
  // delay before next reading:
  delay(100);

}
