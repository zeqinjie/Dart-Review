main() {
  var d = D();
  d.play();
}

class A {
  void play() {
    print("aaaaaa");
  }
}

class B {
  void play() {
    print("bbbbb");
  }
}

class C {
  void play() {
    print("ccccc");
  }
}

class D with A {
  void play() {
    print("ddddd");
  }
}
