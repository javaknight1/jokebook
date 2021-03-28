class Bit {
  String title = '';
  String description = '';
  Type type = Type.Bit;

  Type getTypeObject(type) {
    if (type == Type.Bit.index) {
      return Type.Bit;
    } else if (type == Type.Premise.index) {
      return Type.Premise;
    } else if (type == Type.Story.index) {
      return Type.Story;
    }
    return null;
  }

  save() {
    print('saving user using a web service');
  }
}

enum Type {
  Bit,
  Premise,
  Story
}