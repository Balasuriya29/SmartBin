# 1 "C:\\Users\\suriy\\Downloads\\Sensor-Part - Smart Bin\\HEX CODE for Ultrasonic Sensor\\ultrasonic\\ultrasonic.ino"

# 3 "C:\\Users\\suriy\\Downloads\\Sensor-Part - Smart Bin\\HEX CODE for Ultrasonic Sensor\\ultrasonic\\ultrasonic.ino" 2

LiquidCrystal lcd(2, 3, 4, 5, 6, 7);

const int trigPin = 12; // Trigger Pin of Ultrasonic Sensor
const int echoPin = 11; // Echo Pin of Ultrasonic Sensor

void setup()
{
Serial.begin(9600); // Starting Serial Terminal

lcd.begin(16,2);
pinMode(trigPin, 0x1);
pinMode(echoPin, 0x0);
lcd.setCursor(0,0);
lcd.print("  Distance    ");
Serial.print("  Distance    ");
lcd.setCursor(0,1);
lcd.print("  Measurement  ");
Serial.print("  Measurement  ");
delay(1000);
lcd.clear();

}

void loop()
{
  long duration, inches, cm;
  pinMode(trigPin, 0x1);
  digitalWrite(trigPin, 0x0);
  delayMicroseconds(2);
  digitalWrite(trigPin, 0x1);
  delayMicroseconds(10);
  digitalWrite(trigPin, 0x0);

  pinMode(echoPin, 0x0);
  duration = pulseIn(echoPin, 0x1);
  inches = microsecondsToInches(duration);
  cm = microsecondsToCentimeters(duration);

Serial.print("Distance:");
  Serial.print(cm);
  Serial.print("cm");
  delay(100);
  Serial.println();
lcd.setCursor(0,0);
lcd.print("");
delay(10);
lcd.setCursor(0,1);
lcd.print("Distance:");
lcd.print(cm);
lcd.print("cm");
delay(100);
}

long microsecondsToInches(long microseconds)
{
 return microseconds / 74 / 2;
}

long microsecondsToCentimeters(long microseconds)
{
   return microseconds / 29 / 2;
}
