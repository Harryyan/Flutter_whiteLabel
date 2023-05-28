class SubjectEntity {
  Subject? subject;
  var rank;
  var delta;

  SubjectEntity.fromMap(Map<String, dynamic> map) {
    var subjectMap = map['subject'];

    rank = map['rank'];
    delta = map['delta'];
    subject = Subject.fromMap(subjectMap);
  }
}

class Subject {
  var id;
  var original_title;
  var year;
  var poster;

  // Rating? rating;

  Subject.fromMap(Map<String, dynamic> map) {
    original_title = map['title'];
    year = map['year'];
    poster = map['poster'];
    id = map['id'];
    var rating = map['rating'];
    // this.rating = Rating(
    //     rating['count'], rating['max'], rating['star_count'], rating['value']);
  }
}

class Rating {
  var count;
  var max;
  var star_count;
  var value;

  Rating(this.count, this.max, this.star_count, this.value);
}
