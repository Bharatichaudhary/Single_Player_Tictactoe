import "package:flutter/material.dart";
import 'dart:math';

List<String> value = [" ", " ", " ", " ", " ", " ", " ", " ", " "];
int val = 0;
String winner = "";
String winn = "";
int number = 0;
int x = 0, a = 0, b = 0, z = 0;
String result = "";
int color = 0;
const myStyle = [Colors.green, Colors.red, Colors.yellow];

String win() {
  winner = "";
  if (x == 8) {
    winner = "Draw";
  }
  x++;
  print(x);

  if ((value[0] == value[1] && value[1] == value[2]) ||
      (value[0] == value[3] && value[3] == value[6]) ||
      (value[0] == value[4] && value[4] == value[8])) {
    if (value[0] != " ") {
      winner = "${value[0]}";
    }
  } else if ((value[1] == value[4] && value[4] == value[7]) ||
      (value[4] == value[3]) && (value[4] == value[5]) ||
      (value[4] == value[2] && value[2] == value[6])) {
    if (value[4] != " ") {
      winner = "${value[4]}";
    }
  } else if ((value[2] == value[5] && value[5] == value[8]) ||
      (value[6] == value[7] && value[7] == value[8])) {
    if (value[8] != " ") {
      winner = "${value[8]}";
    }
  }
  return winner;
}

int getComputer() {
  int number = Random().nextInt(9);

  if (value[2]==" "&&((value[0] == value[1]) && (value[0] != " ") ||
      (value[4] == value[6]) && (value[4] != " ") ||
      (value[8] == value[5]) && (value[8] != " "))) {
        number = 2;
  } else if (value[1]==" "&&((value[0] == value[2]) && (value[0] != " ") ||
      (value[4] == value[7]) && (value[4] != " "))) {
    number = 1;
  } else if (value[0]==" "&&((value[2] == value[1]) && (value[2] != " ") ||
      (value[3] == value[6]) && (value[3] != " ") ||
      (value[4] == value[8]) && (value[4] != " "))) {
    number = 0;
  } else if (value[3]==" "&&((value[0] == value[6]) && (value[0] != " ") ||
      (value[4] == value[6]) && (value[4] != " "))) {
    number = 3;
  } else if (value[4]==" "&&((value[0] == value[8]) && (value[0] != " ") ||
      (value[3] == value[5]) && (value[3] != " ") ||
      (value[6] == value[2]) && (value[6] != " ") ||
      (value[1] == value[7]) && (value[1] != " "))) {
    number = 4;
  } else if (value[5]==" "&&((value[3] == value[4]) && (value[3] != " ") ||
      (value[2] == value[8]) && (value[2] != " "))) {
    number = 5;
  } else if (value[6]==" "&&((value[0] == value[3]) && (value[0] != " ") ||
      (value[2] == value[4]) && (value[2] != " ") ||
      (value[7] == value[8]) && (value[7] != " "))) {
    number = 6;
  } else if (value[7]==" "&&((value[0] == value[4]) && (value[0] != " ") ||
      (value[1] == value[4]) && (value[1] != " ") ||
      (value[6] == value[8]) && (value[6] != " "))) {
    number = 7;
  } else if (value[8]==" "&&((value[0] == value[4]) && (value[0] != " ") ||
      (value[2] == value[5]) && (value[2] != " ") ||
      (value[6] == value[7]) && (value[6] != " "))) {
    number = 8;
  }

  return number;
}

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tic Tac Toe",
      home: Homepage(),
    ));

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Tic Tac Toe"),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 85, 16, 247),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              print("Restart");
              value = [" ", " ", " ", " ", " ", " ", " ", " ", " "];
              winn = " ";
              int number = Random().nextInt(9);
              result = "";
              if (z % 2 == 0) {
                value[number] = "O";
                x = 1;
              } else {
                value = [" ", " ", " ", " ", " ", " ", " ", " ", " "];
                x = 0;
              }
              z++;
            });
          },
          backgroundColor: Color.fromARGB(255, 136, 223, 56),
          child: Icon(
            Icons.restart_alt_rounded,
            color: Color.fromARGB(255, 49, 45, 31),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "Your Score:",
                      style: TextStyle(
                          color: Color.fromARGB(255, 35, 228, 99),
                          fontSize: 25),
                    ),
                    Text(
                      "$a",
                      style: TextStyle(
                          color: Color.fromARGB(255, 35, 228, 99),
                          fontSize: 25),
                    )
                  ],
                ),
                SizedBox(
                  width: 40,
                ),
                Column(
                  children: [
                    Text(
                      "Computer:",
                      style: TextStyle(
                          color: Color.fromARGB(255, 240, 57, 57),
                          fontSize: 25),
                    ),
                    Text(
                      "$b",
                      style: TextStyle(
                          color: Color.fromARGB(255, 240, 57, 57),
                          fontSize: 25),
                    )
                  ],
                )
              ],
            ),
            Center(
                child: Container(
              width: 400,
              height: 400,
              padding: EdgeInsets.all(15),
              child: Center(
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  children: List.generate(
                    9,
                    (index) {
                      return Container(
                          height: 10,
                          width: 10,
                          color: Colors.grey[400],
                          child: Center(
                            child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    if (value[index] == " ") {
                                      value[index] = "X";
                                    }
                                  });

                                  setState(() {
                                    winn = win();
                                    print(winn);
                                    if (winn == "X") {
                                      a++;
                                      result = "You win";
                                      color = 0;
                                    }
                                  });
                                  setState(() {
                                    if (result == "") {
                                      int numb = getComputer();
                                      print("th number is $numb");
                                      for (int i = numb; i < 9; i++) {
                                        if (value[i] == " ") {
                                          value[i] = "O";
                                          break;
                                        }
                                      }
                                    }
                                  });
                                  setState(() {
                                    if(winn==""){
                                    winn = win();
                                    print(winn);
                                    }
                                    if (winn == "O") {
                                      b++;
                                      result = "You lose";
                                      color = 1;
                                    } else if (winn == "Draw") {
                                      result = "Draw";
                                      color = 2;
                                    }
                                  });
                                  //print(number);
                                },
                                child: Text(
                                  "${value[index]}",
                                  style: TextStyle(
                                      fontSize: 50, color: Colors.grey[800]),
                                )),
                          ));
                    },
                  ),
                ),
              ),
            )),
            Text(
              "$result",
              style: TextStyle(color: myStyle[color], fontSize: 40),
            )
          ],
        ));
  }
}

/*class Game_page extends StatefulWidget {
  const Game_page({super.key});

  @override
  State<Game_page> createState() => _Game_pageState();
}

class _Game_pageState extends State<Game_page> {
  @override
  Widget build(BuildContext context) {
    return ;
  }
}*/