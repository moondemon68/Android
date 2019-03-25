//posisi pin LED pada arduino
//Note: jika menggunakan LED default dari arduino
//gunakan pin 13
int ledPin = 13;

//kondisi  LED pada arduino 
//LOW=Tidak Menyala
//HIGH= Mennyala
int ledState = LOW;

// kecepatan komunikasi serial
// default 9600
int serial_baud_rate= 9600;

//data yang diterima saat komunikasi serial 
int data;

//method untuk setup pertama kali
void setup() {
	// setup pin sebagai output_iterator
	pinMode (ledPin, OUTPUT);
	//inisiasi komunikasi serial
	Serial.begin(serial_baud_rate);
}







//method yang dijalankan berulang (continue Loop)
// methon in merupakan method utama pada arduino
void loop()
{
	//cek jika ada data yang masuk ke serial port
	if(Serial.available() > 0) {
		//membaca data pada serial port
		data = Serial.read();
		
		//cek data sama dengan karakter "0"
		//atau 0x30(HEX)
		//atau 48(DEC)
		if (data==48){
			//update status pin menjadi HIGH (LED Menyala)
			digitalWrite(ledPin, HIGH);
			
		// cek data sama dengan karakter "1"
		//atau 0x30(HEX)
		//atau 49(DEC)
		} else if (data==49) {
			//upadate status pin menjadi LOW (LED Tidak Menyala)
			digitalWrite(ledPin, LOW);
		}
	}
}