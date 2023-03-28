class MondayModel{
  Map<String,String> firstPeriod; 
  Map<String,String> secondPeriod; 
  Map<String,String> thirdPeriod; 
  Map<String,String> fouthPeriod; 
  Map<String,String> fifthPeriod; 
  Map<String,String> sixthPeriod; 
  Map<String,String> seventhPeriod; 
  String dayName;

  MondayModel({required this.firstPeriod, required this.secondPeriod, required this.thirdPeriod, required this.fouthPeriod,
  required this.fifthPeriod, required this.sixthPeriod, required this.seventhPeriod, required this.dayName}); 

    factory MondayModel.fromJson(Map<String, dynamic> json) =>
      MondayModel(
        firstPeriod: json["firstPeriod"] ?? '',
        secondPeriod: json["secondPeriod"] ?? '',
        thirdPeriod: json["thirdPeriod"] ?? '',
        fouthPeriod: json["fouthPeriod"] ?? '',
        fifthPeriod: json["fifthPeriod"] ?? '',
        sixthPeriod: json["sixthPeriod"] ?? '',
        seventhPeriod: json["seventhPeriod"] ?? '', 
        dayName: json["dayName"]?? ''
      );

  Map<String, dynamic> toJson() => {
        "firstPeriod": firstPeriod, 
        "secondPeriod": secondPeriod,  
        "thirdPeriod": thirdPeriod, 
        "fouthPeriod": fouthPeriod,  
        "fifthPeriod": fifthPeriod, 
        "sixthPeriod": sixthPeriod, 
        "seventhPeriod": seventhPeriod,
};
}