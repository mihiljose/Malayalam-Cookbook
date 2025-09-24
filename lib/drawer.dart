import 'package:flutter/material.dart';
import 'package:kea_bengaluru/pages/gallery.dart';
import 'package:kea_bengaluru/pages/activities.dart';
import 'package:kea_bengaluru/pages/news.dart';
import 'package:kea_bengaluru/pages/contact.dart';
import 'package:kea_bengaluru/pages/events.dart';
import 'package:kea_bengaluru/pages/about.dart';




class myDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: new ListView(
        children: <Widget>[

          InkWell(
            onTap: (){

              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> aboutKea())
              );
            },
            child: ListTile(
              title: Text('About KEA'),
              leading: Icon(Icons.border_color,color: Colors.green,),
            ),
          ),



          InkWell(
            onTap: (){

              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> activities())
              );
            },
            child: ListTile(
              title: Text('Activities'),
              leading: Icon(Icons.local_activity,color: Colors.green,),
            ),
          ),

          InkWell(
            onTap: (){

              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> eventsPage())
              );
            },
            child: ListTile(
              title: Text('Events'),
              leading: Icon(Icons.event,color: Colors.green,),
            ),
          ),

          InkWell(
            onTap: (){

              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> news())
              );
            },
            child: ListTile(
              title: Text('News'),
              leading: Icon(Icons.phone_iphone,color: Colors.green,),
            ),
          ),

          InkWell(
            onTap: (){

              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> keaGallery())
              );
            },
            child: ListTile(
              title: Text('Gallery'),
              leading: Icon(Icons.picture_in_picture_alt,color: Colors.green,),
            ),
          ),


          InkWell(
            onTap: (){

              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> contact())
              );
            },
            child: ListTile(
              title: Text('Contact Us'),
              leading: Icon(Icons.phone,color: Colors.green,),
            ),
          ),





        ],
      ),
    );
  }
}

