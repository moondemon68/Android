import android.content.Intent;
import android.os.Bundle;
void onCreate(Bundle savedInstanceState) {
  super.onCreate(savedInstanceState);
}
void setup() {
  size(displayWidth,displayHeight);
  orientation(PORTRAIT);
  background(0);
}
void draw() {
  textAlign(LEFT);
  int text_x=0,text_y=50;
  text("Membuat Kotak",text_x,text_y);
  int kotak_x=0,kotak_y=100,kotak_p=200,kotak_t=50;
  rect(kotak_x,kotak_y,kotak_p,kotak_t);
}
