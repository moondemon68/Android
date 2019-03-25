import ketai.net.bluetooth.*;
import ketai.ui.*;
KetaiBluetooth bt;
KetaiList klist;
import android.content.Intent;
import android.os.Bundle;
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
        bt.writeToDeviceName(currentDeviceConnected, data);
        
  //cek jika posisi layar yang ditekan sama dengan posisi tombol kedua
      } else if(mouseX >= tombol_kirim_x2 && mouseX <= (tombol_kirim_x2+tombol_kirim_panjang2)
                && mouseY >= tombol_kirim_y2 && mouseY <= (tombol_kiri_y2+tombol_kirim_tinggi2) ){
        bt.broadcast(broadcast_data);
      }
}
    
