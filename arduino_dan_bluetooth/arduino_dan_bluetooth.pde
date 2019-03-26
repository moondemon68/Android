// import library untuk serial
import processing.serial.*;

// definisi class untuk serial port pada bluetooth dan arduino
Serial bluetooth;
Serial arduino;

// variabel untuk menerima data dari serial port
char recieved_data;

// setup pertama kali untuk aplikasi berbasis processing
// metod ini serupa dengan void setup() pada arduino
void setup() {
  // definisi serial port untuk bluetooth dan arduino pada com4
  // note: com4 diganti dengan lokasi dimana bluetooth terdeteksi sistem
  bluetooth = new Serial (this, "COM4", 9600);
  arduino = new Serial (this, "COM5", 9600);
  // ukuran GUI
  size (400, 300);
  // warna biru
  fill (0, 0, 255);
}

// mulai eksekusi elemen elemen pada processing (continous loop)
// metod ini serupa dengan void loop() pada arduino
void draw() {
  // membaca data yang diterima
  while (bluetooth.available() > 0) {
    // memasukkan data yang dibaca ke variabel recieved_data
    recieved_data = bluetooth.readChar ();
    arduino.write (recieved_data);
    
    if (recieved_data == '0') {
      fill (255, 0, 0);
      println ("kirim data kondisi lampu nyala ke arduino");
    } else if (recieved_data == '1') {
      fill (0, 0, 255);
      println ("kirim data kondisi lampu tidak nyala ke arduino");
    }
  }
  
  // gambar kotak
  rect (50, 100, 100, 50);
}
