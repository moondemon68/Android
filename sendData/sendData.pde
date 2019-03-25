import ketai.net.bluetooth.*;
import ketai.ui.*;
KetaiBluetooth bt = new KetaiBluetooth(this);
KetaiList klist;
boolean isConfiguring=true;
String currentDeviceConnected="",received_data="";
byte[] data={'t','e','s'};
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
    bt.writeToDeviceName(currentDeviceConnected,data);
    bt.broadcast(data);
  }
}
void onKetaiListSelection(KetaiList klist) {
  String selection = klist.getSelection();
  bt.connectToDeviceByName(selection);
  currentDeviceConnected = selection;
  klist=null;
}
