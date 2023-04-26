import 'dart:html';

class HtmlUtils{
  static void push(String route){
    window.history.pushState(route, '', route);
  }

  static void back(){
    window.history.back();
  }
}