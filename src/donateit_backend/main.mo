// actor {
//   public query func greet(name : Text) : async Text {
//     return "Hello, " # name # "!";
//   };
// };
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DonateIt {
  stable var cval : Float = 300;

  let id = 33332;

  // cval := 300;
  Debug.print(debug_show (cval));
  stable var startTime = Time.now();
  Debug.print(debug_show (startTime));

  public func transfer(amount : Float) {
    cval += amount;
    Debug.print(debug_show (cval));
  };


  public query func totalFund() : async Float {

    return cval;
  };

  public func compound() {
    let crrTime = Time.now();
    let timeElapsedND = crrTime - startTime;
    let timeElapsedS = timeElapsedND / 1000000000;
    cval := cval * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := crrTime;
  };

  // transfer();

};
