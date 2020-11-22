class Question {
  int id;
  String question;
  String answer1;
  String answer2;
  String answer3;
  String answer4;

  Question(
      {this.id,
      this.question,
      this.answer1,
      this.answer2,
      this.answer3,
      this.answer4});

  factory Question.formMap(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      question: json['question'],
      answer1: json['answer1'],
      answer2: json['answer2'],
      answer3: json['answer3'],
      answer4: json['answer4'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      'question': question,
      'anwser1': answer1,
      'anwser2': answer2,
      'anwser3': answer3,
      'anwser4': answer4,
    };
  }
}
