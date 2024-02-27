class LesionDetailsModel {
    String? result;
    Probabilities? probabilities;

    LesionDetailsModel({
        this.result,
        this.probabilities,
    });

    factory LesionDetailsModel.fromJson(Map<String, dynamic> json) => LesionDetailsModel(
        result: json["result"],
        probabilities: json["probabilities"] == null ? null : Probabilities.fromJson(json["probabilities"]),
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "probabilities": probabilities?.toJson(),
    };
}

class Probabilities {
    double? actinicKeratoses;
    double? basalCellCarcinoma;
    double? benignKeratosisLikeLesions;
    double? dermatofibroma;
    double? melanocyticNevi;
    double? melanoma;
    double? vascularLesions;

    Probabilities({
        this.actinicKeratoses,
        this.basalCellCarcinoma,
        this.benignKeratosisLikeLesions,
        this.dermatofibroma,
        this.melanocyticNevi,
        this.melanoma,
        this.vascularLesions,
    });

    factory Probabilities.fromJson(Map<String, dynamic> json) => Probabilities(
        actinicKeratoses: json["Actinic keratoses"]?.toDouble(),
        basalCellCarcinoma: json["Basal cell carcinoma"]?.toDouble(),
        benignKeratosisLikeLesions: json["Benign keratosis-like lesions"]?.toDouble(),
        dermatofibroma: json["Dermatofibroma"]?.toDouble(),
        melanocyticNevi: json["Melanocytic nevi"],
        melanoma: json["Melanoma"]?.toDouble(),
        vascularLesions: json["Vascular lesions"]?.toDouble(),
    );

  get length => null;

    Map<String, dynamic> toJson() => {
        "Actinic keratoses": actinicKeratoses,
        "Basal cell carcinoma": basalCellCarcinoma,
        "Benign keratosis-like lesions": benignKeratosisLikeLesions,
        "Dermatofibroma": dermatofibroma,
        "Melanocytic nevi": melanocyticNevi,
        "Melanoma": melanoma,
        "Vascular lesions": vascularLesions,
    };
}
