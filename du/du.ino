
int pin = 13;
int val = 0;


void setup() {
  pinMode(pin, INPUT);
  Serial.begin(9600);
}


bool sent = false;

void loop() {
  val = digitalRead(pin);
  
  if (val == HIGH && sent == false) {
    sent = true;
    Serial.print(true);
  } else if (val == LOW) {
    sent = false;
  }
}


int steps = 10;

void resetMean() {
}

//exports.Mean.prototype.push = function (x) {
//  var i = ++ this.length;
//  var m = this.mean || 0;
//  this.mean = m - m / i + x / i;
//  return this.mean;
//};
