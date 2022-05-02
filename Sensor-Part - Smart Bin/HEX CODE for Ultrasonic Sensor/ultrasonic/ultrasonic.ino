
#include <LiquidCrystal.h>  

LiquidCrystal lcd(2, 3, 4, 5, 6, 7);  

const int trigPin = 12; // Trigger Pin of Ultrasonic Sensor
const int echoPin = 11; // Echo Pin of Ultrasonic Sensor

void setup() 
{
Serial.begin(9600); // Starting Serial Terminal

lcd.begin(16,2);                                                   
pinMode(trigPin, OUTPUT);
pinMode(echoPin, INPUT);
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
  pinMode(trigPin, OUTPUT);
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  pinMode(echoPin, INPUT);
  duration = pulseIn(echoPin, HIGH);
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
