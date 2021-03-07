import 'package:flutter/material.dart';
import 'signin_facebook.dart' as auth;

import 'package:maseeha_2/Patient/signin_google.dart' as googleauth;
import 'package:maseeha_2/localization/demo_localization.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          auth.a.isLoggedIn
              ? Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  color: Theme.of(context).primaryColor,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(
                            top: 30,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(auth.a.userProfileList[
                                          auth.E.photoURL.index] !=
                                      null
                                  ? auth
                                      .a.userProfileList[auth.E.photoURL.index]
                                  : 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fflutterappworld.com%2Fa-high-performance-flutter-widget-to-render-bottts-svg-avatars%2F&psig=AOvVaw0pbd2aLdtAYDPZSY8ZCbFK&ust=1605966714142000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCODx_sSike0CFQAAAAAdAAAAABAJ'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            auth.a.userProfileList[auth.E.email.index] != null
                                ? auth.a.userProfileList[auth.E.email.index]
                                : 'abc@gmail.com',
                          ),
                        ),
                        Text(
                          auth.a.userProfileList[auth.E.username.index] != null
                              ? auth.a.userProfileList[auth.E.username.index]
                              : 'abc@gmail.com',
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  color: Theme.of(context).primaryColor,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(
                            top: 30,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(googleauth
                                              .abc.userProfileList[
                                          googleauth.E.photoURL.index] !=
                                      null
                                  ? googleauth.abc.userProfileList[
                                      googleauth.E.photoURL.index]
                                  : 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fflutterappworld.com%2Fa-high-performance-flutter-widget-to-render-bottts-svg-avatars%2F&psig=AOvVaw0pbd2aLdtAYDPZSY8ZCbFK&ust=1605966714142000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCODx_sSike0CFQAAAAAdAAAAABAJ'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            googleauth.abc.userProfileList[
                                        googleauth.E.email.index] !=
                                    null
                                ? googleauth.abc
                                    .userProfileList[googleauth.E.email.index]
                                : 'abc@gmail.com',
                          ),
                        ),
                        Text(
                          googleauth.abc.userProfileList[
                                      googleauth.E.username.index] !=
                                  null
                              ? googleauth.abc
                                  .userProfileList[googleauth.E.username.index]
                              : 'abc@gmail.com',
                        ),
                      ],
                    ),
                  ),
                ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              DemoLocalization.of(context).getTranslatedValue('Profile'),
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              DemoLocalization.of(context).getTranslatedValue('Settings'),
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: null,
          ),
          ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text(
                DemoLocalization.of(context).getTranslatedValue('LogOut'),
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                if (auth.a.isLoggedIn) {
                  auth.a.logout(context);
                }
                if (googleauth.abc.isGoogleLoggedIn) {
                  print('abcdef');
                  googleauth.abc.logout(context);
                }
              }),
        ],
      ),
    );
  }
}
