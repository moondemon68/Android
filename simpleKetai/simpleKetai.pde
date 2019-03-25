import ketai.net.bluetooth.*;
import ketai.ui.*;
KetaiBluetooth bt;
KetaiList klist;
void setup() {
  size(displayWidth,displayHeight);
  orientation(PORTRAIT);
  background(0);
  bt.start();
  isConfiguring=true;
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
  }
}
void onKetaiListSelection(KetaiList klist) {
  String selection = klist.getSelection();
  bt.connectToDeviceByName(selection);
  currentDeviceConnected = selection;
  klist=null;
}
