
int pin = 13;
int val = 0;
int inc = 3;


void setup() {
  pinMode(pin, INPUT);
  Serial.begin(9600);
}


bool sent = false;

void loop() {
  val = digitalRead(pin);
  if (val == HIGH && sent == false) {
    sent = true;
    Serial.print(inc);
  } else if (val == LOW) {
    sent = false;
    Serial.print(false);
  } else {
    Serial.print(false);
  }
  delay(35);
}

