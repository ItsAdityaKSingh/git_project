import 'package:flutter/material.dart';
import 'ResultPage.dart';
import 'MCQ.dart';
import 'StartScreen.dart';
import 'quiz.dart';
void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _state = 1;
  void _toggle(int val) {
    setState(() {
      _state = val;
    });
  }

  Map<int, int> map = {};
  void _answerQuestion(int key, int val) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        map[key] = val;
      });
    });
  }

  List<MCQ> mcqs = [
    MCQ(
      id: 1,
      question: "What is the primary purpose of React?",
      options: [
        "a) To handle routing in single-page applications",
        "b) To create server-side applications",
        "c) To build user interfaces, especially for single-page applications",
        "d) To manage databases in web applications",
      ],
      correctOptionIndex: 2,
    ),
    MCQ(
      id: 2,
      question: "Which of the following is true about JSX?",
      options: [
        "a) It is a separate language that must be compiled into JavaScript",
        "b) It is a syntax extension that allows writing HTML within JavaScript",
        "c) It is used to write backend server code",
        "d) It is a CSS preprocessor used in React applications",
      ],
      correctOptionIndex: 1,
    ),
    MCQ(
      id: 3,
      question:
          "Which method in the React.Component lifecycle is called after the component is rendered for the first time?",
      options: [
        "a) componentWillMount",
        "b) componentDidMount",
        "c) componentWillUpdate",
        "d) componentDidUpdate",
      ],
      correctOptionIndex: 1,
    ),
    MCQ(
      id: 4,
      question: "How do you pass data to a React component?",
      options: [
        "a) Using components",
        "b) Using props",
        "c) Using state",
        "d) Using lifecycle methods",
      ],
      correctOptionIndex: 1,
    ),
    MCQ(
      id: 5,
      question: "What is the purpose of the `key` prop in React?",
      options: [
        "a) To uniquely identify elements in an array for performance optimization",
        "b) To pass data between components",
        "c) To handle event handlers",
        "d) To define styles for components",
      ],
      correctOptionIndex: 0,
    ),
    MCQ(
      id: 6,
      question:
          "Which of the following hooks is used to handle side effects in functional components?",
      options: [
        "a) useState",
        "b) useReducer",
        "c) useEffect",
        "d) useContext",
      ],
      correctOptionIndex: 2,
    ),
    MCQ(
      id: 7,
      question: "What is the virtual DOM in React?",
      options: [
        "a) A direct representation of the real DOM",
        "b) A lightweight copy of the real DOM that is kept in memory and synced with the real DOM by React",
        "c) A new browser feature used by React to improve performance",
        "d) A special API provided by React to handle asynchronous operations",
      ],
      correctOptionIndex: 1,
    ),
    MCQ(
      id: 8,
      question: "How can you create a functional component in React?",
      options: [
        "a) class MyComponent extends React.Component { render() { return <div>Hello</div>; }}",
        "b) function MyComponent() { return <div>Hello</div>; }",
        "c) const MyComponent = React.createComponent({ render() { return <div>Hello</div>; }});",
        "d) const MyComponent = createComponent({ render() { return <div>Hello</div>; }});",
      ],
      correctOptionIndex: 1,
    ),
    MCQ(
      id: 9,
      question: "What is the correct way to update state in a React component?",
      options: [
        "a) this.state = { key: value }",
        "b) this.setState({ key: value })",
        "c) this.updateState({ key: value })",
        "d) this.changeState({ key: value })",
      ],
      correctOptionIndex: 1,
    ),
    MCQ(
      id: 10,
      question:
          "What is the significance of the `defaultValue` attribute in a React `<input>` element?",
      options: [
        "a) It sets the initial value of an uncontrolled component",
        "b) It sets the value of a controlled component",
        "c) It provides a placeholder for the input",
        "d) It handles the form submission event",
      ],
      correctOptionIndex: 0,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: _state == 1
            ? StartScreen(
                toggle: _toggle,
              )
            : _state == 2
                ? SurveyPage(
                    mcqs: mcqs,
                    answerQuestion: _answerQuestion,
                    toggle: _toggle,
                  )
                : ResultPage(
                    toggle: _toggle,
                    map: map,
                    mcqs: mcqs,
                  ),
      ),
    );
  }
}
