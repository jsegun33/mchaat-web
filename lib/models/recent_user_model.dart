class RecentUser {
  final String? icon, name, date, posts, role, email;

  RecentUser(
      {this.icon, this.name, this.date, this.posts, this.role, this.email});
}

List recentUsers = [
  RecentUser(
    icon: "assets/icons/xd_file.svg",
    name: "Shopee",
    role: "15",
    email: "10,000.00",
    date: "80%",
    posts: "Complete",
  ),
  RecentUser(
    icon: "assets/icons/Figma_file.svg",
    name: "Lazada",
    role: "15",
    email: "10,000.00",
    date: "80%",
    posts: "Complete",
  ),
  RecentUser(
    icon: "assets/icons/doc_file.svg",
    name: "mChaat",
    role: "15",
    email: "10,000.00",
    date: "80%",
    posts: "Complete",
  ),
  RecentUser(
    icon: "assets/icons/sound_file.svg",
    name: "Carousell",
    role: "15",
    email: "10,000.00",
    date: "80%",
    posts: "Complete",
  ),
  // RecentUser(
  //   icon: "assets/icons/media_file.svg",
  //   name: "A**** S**** K****",
  //   role: "Line Manager",
  //   email: "ah****az@google.com",
  //   date: "23-02-2021",
  //   posts: "2",
  // ),
  // RecentUser(
  //   icon: "assets/icons/pdf_file.svg",
  //   name: "T***** S****",
  //   role: "UI/UX Designer",
  //   email: "te****cu@google.com",
  //   date: "25-02-2021",
  //   posts: "3",
  // ),
  // RecentUser(
  //   icon: "assets/icons/excle_file.svg",
  //   name: "K***** D****",
  //   role: "Business Analyst",
  //   email: "ke****an@gmail.com",
  //   date: "25-02-2021",
  //   posts: "34",
  // ),
];
