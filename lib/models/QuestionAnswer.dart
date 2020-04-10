class QuestionAnswer {
  final String question;
  final String answer;
  final int likes;
  bool isExpanded;
  
  QuestionAnswer({
    this.question, this.answer, this.likes, this.isExpanded = false
  });
  
  factory QuestionAnswer.fromMap(Map<String, dynamic> data, String docId) {
    if (data == null) {
      return null;
    }
    
    return QuestionAnswer(
      question: data['question'],
      answer: data['answer'],
      likes: data['likes']
    );
  }
}

//var faqList = [
//  QuestionAnswer(question: 'Whata is Corona Virus?', answer: 'It really sucks'),
//  QuestionAnswer(question: 'How to stay home Whata is Corona Virus? Whata is Corona Virus??', answer: 'Keeping each other safe and connected is everyone responsibility. Keeping each other safe and connected is everyones responsibilityKeeping each other safe and connected is everyones responsibility'),
//];