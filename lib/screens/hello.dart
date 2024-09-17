import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget{
  const EditProfileScreen({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Edit Profile',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 25,

            ),
          ),
        ),
        body: ListView(

            children:[
              Container(
                child: Stack(
                    clipBehavior: Clip.none, // Allows the profile image to overflow
                    children: [

                      // Cover Image
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/cover_img.jfif'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // Profile Image (Positioned on top)
                      const Positioned(
                          bottom: -50,
                          left:0,
                          right:0,// Adjusted to align the profile image
                          child: Stack(

                              children:[
                                Center(
                                  child: CircleAvatar(
                                    radius:74,
                                    backgroundColor: Colors.white54,
                                    child: CircleAvatar(
                                      radius: 70,
                                      backgroundColor: Colors.white,
                                      backgroundImage: AssetImage('assets/images/profile_img.jfif'),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top:40,
                                    right:125,
                                    bottom:-40,
                                    child: Icon(
                                      Icons.add_a_photo_outlined,
                                      size: 40,
                                      color: Colors.white54,
                                    )
                                )
                              ]
                          )),

                      const Positioned(
                        top:0,
                        right:10,
                        child:    Icon(
                            Icons.add_a_photo_outlined,
                            color:Colors.white54,
                            size:50
                        ),
                      ),
                    ]),
              ),


              SizedBox(height:70),

              // Editable Name Field
              Container(
                padding:  EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              //Editable Bio field
              Container(
                padding:  EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Bio',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              //Editable About me
              Container(
                padding:  EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'About me',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              //Editable Mobile and email
              Container(
                padding:  EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Mobile',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                padding:  EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              // add skills
              Container(
                padding:  EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Skills',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.all(15), // Adding some padding around the button
                decoration: BoxDecoration(
                  color: Colors.blue[50],  // Background color of the container
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                    onPressed:null,
                    child: Text('Save')
                ),
              ),
            ]


        )
    );
  }
}
