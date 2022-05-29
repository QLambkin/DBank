import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;

  stable var startTime = Time.now();
  // startTime := Time.now();
  Debug.print(debug_show(startTime));

  public func topUp(amount: Float){
    currentValue += amount;

    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float){
    let tempValue: Float = currentValue - amount;

    if(tempValue >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Amount too large, remaining value less than zero.");
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func compound(){
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    let timeElapsedM = timeElapsedS / 60;
    let timeElapsedH = timeElapsedM / 60;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedM));
    startTime := currentTime;

    Debug.print(debug_show(currentValue));
  };

  public func setAmount(amount: Float){
    currentValue := amount;
  }

}