/// Challenge
/// Accounts Merge
// Given a list accounts, each element accounts[i] is a list of strings, where
// the first element accounts[i][0] is a name, and the rest of the elements are
// emails representing emails of the account.
//
// Now, we would like to merge these accounts. Two accounts definitely belong to
// the same person if there is some email that is common to both accounts. Note
// that even if two accounts have the same name, they may belong to different people
// as people could have the same name. A person can have any number of accounts
// initially, but all of their accounts definitely have the same name.
//
// After merging the accounts, return the accounts in the following format: the
// first element of each account is the name, and the rest of the elements are
// emails in sorted order. The accounts themselves can be returned in any order.
/// Example 1:
/// Input:
// accounts = [["John", "johnsmith@mail.com", "john00@mail.com"],
// ["John", "johnnybravo@mail.com"], ["John", "johnsmith@mail.com", "john_newyork@mail.com"],
// ["Mary", "mary@mail.com"]]
/// Output: [["John", 'john00@mail.com', 'john_newyork@mail.com', 'johnsmith@mail.com'],
/// ["John", "johnnybravo@mail.com"], ["Mary", "mary@mail.com"]]
List<List<String>> accountsMerge(List<List<String>> accounts) {
  for (int i = 0; i < accounts.length; i++) {
    for (int j = 0; j < accounts.length; j++) {
      if (i != j) {
        if (haveCommonMails(accounts[i], accounts[j])) {
          accounts[i] = addCommonMailsWithUser(accounts[i], accounts[j]);
          accounts.removeAt(j);
          j=0;
        }
      }
    }
  }

  print(accounts);
  return accounts;
}

bool haveCommonMails(List<String> list1, List<String> list2) {
  for (int i = 1; i < list1.length; i++) {
    for (int j = 1; j < list2.length; j++) {
      if (list1[i] == list2[j]) {
        return true;
      }
    }
  }
  return false;
}

List addCommonMailsWithUser(List<String> list1, List<String> list2) {
  List<String> commonMails = [];
  list1.forEach((mails) {
    if (list1.indexOf(mails) != 0 && !(commonMails.contains(mails))) {
      commonMails.add(mails);
    }
  });
  list2.forEach((mails) {
    if (list2.indexOf(mails) != 0 && !(commonMails.contains(mails))) {
      commonMails.add(mails);
    }
  });
  commonMails.sort();
  commonMails.insert(0, list1[0]);
  return commonMails;
}



main() {
  accountsMerge([
    ["John", "johnsmith@mail.com", "john00@mail.com"],
    ["John", "johnnybravo@mail.com"],
    ["John", "johnsmith@mail.com", "john_newyork@mail.com"],
    ["Mary", "mary@mail.com"]
  ]);
  accountsMerge([
    ['john', 'a', 'b'],
    ['john', 'b', 'c'],
    ['john', 'c', 'd'],
  ]);

  accountsMerge([
    ['john', 'a', 'b'],
    ['john', 'c', 'd'],
    ['john', 'b', 'c'],
    ['john', 'e', 'd'],
    ['john', 'e', 'f'],
  ]);
}
