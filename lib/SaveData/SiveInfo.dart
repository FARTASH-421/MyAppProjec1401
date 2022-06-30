class Information {
  var userName;
  var number;
  var password;
  var UserAcount;
  var email;

  Information(this.userName, this.number, this.password, this.UserAcount,
      this.email);
  Map toJson() => {
    'userName': this.userName,
    'number': this.number,
    'password': this.password,
    'UserAccount': this.UserAcount,
    'email': this.email,
  };
}