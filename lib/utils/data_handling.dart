String contactNumUtil(String contact) {
  var newContact = "";
  var contactChar = contact.split('');

  if (contactChar[0].toString() == "0") {
    contactChar[0] = "+234";
    newContact = contactChar.join();
  } else if (contactChar[0].toString() != "0" &&
      contactChar[0].toString() != "+") {
    return "+234$contact";
  } else if (contactChar[0].toString() == "+") {
    return contact;
  }
  return newContact;
}
