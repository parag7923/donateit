import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DonateIt {
  stable var cval : Float = 300;

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

  // transfer();

};
