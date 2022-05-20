enum Role {
  child,
  parent,
}

extension Api on Role {
  String toApiString() {
    if (this == Role.child) {
      return 'child';
    } else {
      return 'parent';
    }
  }
}

Role roleFromString(String data) {
  if (data == 'child') {
    return Role.child;
  } else {
    return Role.parent;
  }
}
