import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank{
  stable var currentValue: Float = 500;

  stable var startTime= Time.now();

  Debug.print(debug_show(currentValue));

  public func topUp(amount : Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withDraw(amount : Float){
    let tempValue: Float = currentValue - amount;
    if(tempValue>=0){
      currentValue -= amount;
    Debug.print(debug_show(currentValue));
    }
    else{
      Debug.print("Don't have sufficient money in your wallet");
    }
    
  };

  public query func checkBalance(): async Float{
    return currentValue;

  };

  public func compound(){
    var currentTime = Time.now();
    var timeElapsedNS = currentTime - startTime;
    var timeElapsedS = timeElapsedNS/1000000000;
    var timeElapsedyear=timeElapsedS/(60*60*24*365);
    currentValue:= currentValue * ( 1.01 ** Float.fromInt(timeElapsedyear));
    startTime := currentTime;

  };

}