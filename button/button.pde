import ketai.net.bluetooth.*;
import ketai.ui.*;
KetaiBluetooth bt = new KetaiBluetooth(this);
KetaiList klist;
import android.content.Intent;
import android.os.Bundle;
boolean isConfiguring=true;
String currentDeviceConnected="",received_data="";
byte[] data={'t','e','s'};
byte[] red_data={'0'};
byte[] blue_data={'1'};
//variable untuk tombol kirim ke device
int tombol_kirim_x1 = 50;
int tombol_kirim_y1 = 100;
int tombol_kirim_panjang1 = 150;
int tombol_kirim_tinggi1 = 50;

//variabel untuk tombol kirim ke device
int tombol_kirim_x2 = 50;
int tombol_kirim_y2 = 200;
int tombol_kirim_panjang2 = 150;
int tombol_kirim_tinggi2 = 50;

void setup() {
  size(displayWidth,displayHeight);
  orientation(PORTRAIT);
  background(0);
  bt.start();
  isConfiguring=true;
}
void onBluetoothDataEvent(String who,byte[] data) {
  if (isConfiguring) {
    return;
  }
  received_data = new String(data);
}
void draw() {
  if (isConfiguring==true) {
    background(0);
    klist=new KetaiList(this,bt.getPairedDeviceNames());
    isConfiguring=false;
  } else {
    background(150,150,150);
    textAlign(LEFT);
    text("Connected to " + currentDeviceConnected,100,50);
    //bt.writeToDeviceName(currentDeviceConnected,data);
    //bt.broadcast(data);
    
    // Pengiriman Data ---------------------------------------------------//

    //gunakan warna merah untuk tombol kirim data yang pertama
    fill(255,0,0);
    
    //gambar kotak untuk tombol kirim data
    rect(tombol_kirim_x1, tombol_kirim_y1, tombol_kirim_panjang1, tombol_kirim_tinggi1);
    
    ////gunakan warna biru untuk tombol kirim data yang pertama
    fill(0,0,255);
    
    //gambar kotak untuk tombol kirim data
    rect(tombol_kirim_x2, tombol_kirim_y2, tombol_kirim_panjang2, tombol_kirim_tinggi2);
    
    //event ketika layar ditekan
    if(mousePressed) {
      
      //cek jika posisi layar yang ditekan sama dengan posisi tombol pertama
      if(mouseX >= tombol_kirim_x1 && mouseX <= (tombol_kirim_x1+tombol_kirim_panjang1)
          && mouseY >= tombol_kirim_y1 && mouseY <= (tombol_kirim_y1+tombol_kirim_tinggi1) ){
            bt.writeToDeviceName(currentDeviceConnected, red_data);
            
      //cek jika posisi layar yang ditekan sama dengan posisi tombol kedua
          } else if(mouseX >= tombol_kirim_x2 && mouseX <= (tombol_kirim_x2+tombol_kirim_panjang2)
                    && mouseY >= tombol_kirim_y2 && mouseY <= (tombol_kirim_y2+tombol_kirim_tinggi2) ){
            bt.broadcast(blue_data);
          }
    }
  }
}
void onKetaiListSelection(KetaiList klist) {
  String selection = klist.getSelection();
  bt.connectToDeviceByName(selection);
  currentDeviceConnected = selection;
  klist=null;
}    
