import 'package:flutter/material.dart';
import 'package:loginsample/Presentations/loginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogOutScreen extends StatefulWidget {
  // final String name;

  const LogOutScreen({super.key});

  @override
  State<LogOutScreen> createState() => _LogOutScreenState();
}

class User {
  int id;
  String Username;
  int Age;
  String image_path;
  User(this.id, this.Username, this.Age, this.image_path);
}

class _LogOutScreenState extends State<LogOutScreen> {
  List<User> users = [
    User(1, "Anu", 22, "assets/splash.png"),
    User(2, "Achu", 21, "assets/splash.png"),
    User(3, "Anuja", 20, "assets/splash.png"),
    User(4, "Akhil", 24, "assets/splash.png"),
    User(5, "Anjana", 18, "assets/splash.png"),
    User(6, "kunju", 22, "assets/splash.png"),
    User(7, "Ammu", 24, "assets/splash.png"),
    User(8, "Anusha", 27, "assets/splash.png"),
    User(9, "Jithin", 19, "assets/splash.png"),
    User(10, "Arun", 28, "assets/splash.png"),
    User(11, "Ammu", 25, "assets/splash.png"),
    User(12, "Anusha", 24, "assets/splash.png"),
    User(13, "Jithin", 19, "assets/splash.png"),
    User(14, "Arun", 28, "assets/splash.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title:const Text("Home"),
        actions: [
          IconButton(
              onPressed: () {
                logout(context);
              },
              icon: const Icon(Icons.exit_to_app_rounded)),
        ],
      ),
      body: SafeArea(
          child: users.isEmpty
              ? const Text("No users")
              : ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const ScrollPhysics(),
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      leading: Container(width: 60,height: 60,padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape:index%2!=0? BoxShape.circle:BoxShape.rectangle,color: Colors.black54
                      ),
                        child: Image.asset(users[index].image_path,fit: BoxFit.cover,),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name: ${users[index].Username}",style: const TextStyle(fontWeight: FontWeight.w600,fontFamily: 'Courier',),),
                          Text("Age: ${users[index].Age.toString()}",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 14, fontFamily: 'Courier',),),
                        ],
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            //alertBox
                            showDialog(
                                context: ctx,
                                builder: (ctx1) {
                                  return AlertDialog(
                                    title: const Text("Delete User"),
                                    content: const Text(
                                        "Do you want to delete this user......?"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(ctx1).pop();
                                          },
                                          child: const Text("Close")),
                                      TextButton(
                                        onPressed: () {
                                          users.removeAt(index);
                                          setState(() {});
                                          ScaffoldMessenger.of(ctx)
                                              .showSnackBar(const SnackBar(
                                            behavior: SnackBarBehavior.floating,
                                            backgroundColor: Colors.greenAccent,
                                            duration: Duration(seconds: 3),
                                            margin: EdgeInsets.all(15.0),
                                            content: Text(
                                                "User Deleted Succesfully"),
                                          ));
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("Delete"),
                                      ),
                                    ],
                                  );
                                }
                                );
                          },
                          icon: const Icon(
                            Icons.delete_rounded,
                            color: Colors.grey,
                          )),
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return const Divider();
                  },
                  itemCount: users.length)),
    );
  }

  logout(BuildContext ctx) async {
    final sharedprfs = await SharedPreferences.getInstance();
    // ignore: use_build_context_synchronously
    showDialog(
        context: ctx,
        builder: (ctx1) {
          return AlertDialog(
            title: const Text("Logout"),
            content: const Text(
                "Do you want to logout......?"),
            actions: [
              TextButton(
                  onPressed: () {

                    Navigator.of(ctx1).pop();
                  },
                  child: const Text("Close")), TextButton(
                  onPressed: () async{
                    await sharedprfs.clear();
                    // ignore: use_build_context_synchronously
                    Navigator.of(ctx).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (ctx1) => const LoginScreen()), (route) => false);
                  },
                  child: const Text("Logout")),
            ],
          );
        }
    );

  }
}
