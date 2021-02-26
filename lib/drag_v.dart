import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CustomiseButtons extends StatefulWidget {
  @override
  _CustomiseButtons createState() => new _CustomiseButtons();
}

class _CustomiseButtons extends State<CustomiseButtons> {
  final buttonList = [
    new Buttons(
      0,
      'Market',
    ),
    new Buttons(
      1,
      'Statements',
    ),
    new Buttons(
      2,
      'learning',
    ),
    new Buttons(
      3,
      'Research&Advisory',
    ),
    new Buttons(
      4,
      'watchlist',
    ),
    new Buttons(
      5,
      'Portfolio',
    ),
    new Buttons(
      6,
      'Buy/Sell',
    ),
    new Buttons(
      7,
      'Analysis&Chart',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    List<Buttons> selectedItem = List();
    List<Buttons> Temp = List();

    Temp.insert(
      0,
      new Buttons(
        0,
        'Market',
      ),
    );
    Temp.insert(
      1,
      new Buttons(
        1,
        'Statements',
      ),
    );
    Temp.insert(
        2,
        new Buttons(
          2,
          'learning',
        ));

    Temp.insert(
        3,
        new Buttons(
          7,
          'O&T Book',
        ));

    Temp.insert(
        4,
        new Buttons(
          8,
          'More',
        ));

    selectedItem.insert(0, Temp[0]);
    selectedItem.insert(1, Temp[1]);
    selectedItem.insert(2, Temp[2]);
    selectedItem.insert(3, Temp[3]);
    selectedItem.insert(
        4,
        new Buttons(
          8,
          'More',
        ));

    List<int> l1 = new List();

    for (int i = 0; i < 4; i++) {
      l1.add(selectedItem[i].id);
    }

    print("SelectedItemS" + l1.toString());

    return new CustomizationView(buttonList, l1);
  }
}

class CustomizationView extends StatefulWidget {
  List<Buttons> items;
  List<int> pairlist;
  CustomizationView(this.items, this.pairlist);

  @override
  _CustomizationViewState createState() => new _CustomizationViewState();
}

class _CustomizationViewState extends State<CustomizationView> {
  final _gap = 8.0;
  final _margin = 10.0;

  Map<int, Buttons> pairs = {};

  bool validated = false;

  DropTarget dropTarget1, dropTarget2, dropTarget3, dropTarget4;

  Size getDragableSize({Size areaSize, int numItems}) {
    final landScape = areaSize.width > areaSize.height;
    final targetWidth = (areaSize.width - (2 * _margin) - (_gap * (numItems - 1))) / numItems;
    return new Size(80.0, 80.0);
  }

  Size getTargetSize({Size areaSize, int numItems}) {
    final landScape = areaSize.width > areaSize.height;
    final targetWidth = (areaSize.width - (1 * _margin) - (_gap * (numItems - 1))) / numItems;
    //return new Size(targetWidth, areaSize.height * (landScape ? 0.15 : 0.15));
    return new Size(82.0, 84.0);
  }

  var b0, b1, b2, b3, b4, b5, b6, b7;

  var listB = new List();
  @override
  initState() {
    super.initState();
    // Add listeners to this class

    b0 = new Buttons(
      0,
      'watchlist',
    );
    b0.selected = true;

    b1 = new Buttons(
      1,
      'Buy/Sell',
    );
    b1.selected = true;

    b2 = new Buttons(
      2,
      'Portfolio',
    );
    b2.selected = true;

    b3 = new Buttons(
      3,
      'Research & Advisory',
    );
    b3.selected = true;

    b4 = new Buttons(
      4,
      'Market',
    );
    b4.selected = true;

    b5 = new Buttons(
      5,
      'Learning',
    );
    b5.selected = true;

    b6 = new Buttons(
      6,
      'Statement',
    );
    b6.selected = true;

    b7 = new Buttons(
      7,
      'O&T Book',
    );
    b7.selected = true;

    listB.add(b0);
    listB.add(b1);
    listB.add(b2);
    listB.add(b3);
    listB.add(b4);
    listB.add(b5);
    listB.add(b6);
    listB.add(b7);

    pairs[0] = b0;
    pairs[1] = b1;
    pairs[2] = b2;
    pairs[3] = b3;
    pairs[4] = b4;
    pairs[5] = b5;
    pairs[6] = b6;
    pairs[7] = b7;
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final size = mq.size;
    final numItems = widget.items.length;
    final draggableSize = getDragableSize(areaSize: size, numItems: numItems);
    final targetSize = getTargetSize(areaSize: size, numItems: numItems);
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: new Container(
            color: Colors.white,
            child: Column(
                mainAxisAlignment: mq.orientation == Orientation.landscape
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.spaceEvenly,
                children: [
                  _buildValidateButton(),
                  _buildTargetRow(targetSize, draggableSize),
                  _buildguide(),
                  _buildDragableList(draggableSize),
                ])));
  }

  Widget _buildValidateButton() => new Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            new RaisedButton(onPressed: _onValidate, child: new Text("SAVE"))
          ]);

  Widget _buildTargetRow(Size targetSize, Size itemSize) {
    dropTarget1 = new DropTarget(widget.items[widget.pairlist[0]],
        selectedItem: pairs[widget.pairlist[0]],
        size: targetSize,
        itemSize: itemSize);
    dropTarget2 = new DropTarget(widget.items[widget.pairlist[1]],
        selectedItem: pairs[widget.pairlist[1]],
        size: targetSize,
        itemSize: itemSize);
    dropTarget3 = new DropTarget(widget.items[widget.pairlist[2]],
        selectedItem: pairs[widget.pairlist[2]],
        size: targetSize,
        itemSize: itemSize);
    dropTarget4 = new DropTarget(widget.items[widget.pairlist[3]],
        selectedItem: pairs[widget.pairlist[3]],
        size: targetSize,
        itemSize: itemSize);

    return new NotificationListener<SelectionNotification>(
        onNotification: _onSelection,
        child: new Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey, style: BorderStyle.solid, width: 1.0)),
            child: new Padding(
                padding: EdgeInsets.only(left: 0.0),
                child: new Row(children: <Widget>[
                  dropTarget1,
                  dropTarget2,
                  dropTarget3,
                  dropTarget4
                ]))));
  }

  Widget _buildguide() {
    return new Padding(
      padding: EdgeInsets.only(top: 30.0, bottom: 30.0),
      child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 5.0, left: 15.0, right: 15.0),
              child: new Text(
                  "Drag & Drop upto 4 buttons to the above box in order to save. ",
                  style: new TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none)),
            )
          ]),
    );
  }

  Widget _buildDragableList(Size itemSize) => new Column(
        children: <Widget>[
          new Row(children: [
            Expanded(
              child: new DraggableButton(b0, size: itemSize),
            ),
            Expanded(
              child: new DraggableButton(b1, size: itemSize),
            ),
            Expanded(
              child: new DraggableButton(b2, size: itemSize),
            ),
            Expanded(
              child: new DraggableButton(b3, size: itemSize),
            ),
          ]),
          new Row(children: [
            Expanded(
              child: new DraggableButton(b4, size: itemSize),
            ),
            Expanded(
              child: new DraggableButton(b5, size: itemSize),
            ),
            Expanded(
              child: new DraggableButton(b6, size: itemSize),
            ),
            Expanded(
              child: new DraggableButton(b7, size: itemSize),
            ),
          ])
        ],
      );

  bool _onSelection(SelectionNotification notify) {
    setState(() {
      // on de-selection
      if (notify.cancel) {
        if (notify.item != null) notify.item.selected = false;
        pairs.remove(notify.dropIndex);
      } else {
        if (pairs[notify.dropIndex] != null)
          pairs[notify.dropIndex].selected = false;
        if (pairs.containsValue(notify.item))
          pairs.remove(pairs.keys.firstWhere((k) => pairs[k] == notify.item));
        _onItemSelection(notify.item, notify.dropIndex);
      }
    });
    return false;
  }

  void _onItemSelection(Buttons selectedItem, int targetId) {
    setState(() {
      if (selectedItem != null) {
        selectedItem.selected = true;
        selectedItem.status = Status.none;
      }

      pairs[targetId] = selectedItem;
    });
  }

  void _onValidate() {
    List<Buttons> l;
    print("_onValidate");
    l = List();

    pairs.forEach((index, item) {
      if (item.selected == true) {
        item.status = Status.correct;
      } else
        item.status = Status.wrong;
    });
    l.add(dropTarget1.selection);
    l.add(dropTarget2.selection);
    l.add(dropTarget3.selection);
    l.add(dropTarget4.selection);

    // StoreProvider.of<AppState>(context).dispatch(Action1(l));

    _showDialog();
  }

  void _onClear() {
    setState(() {
      pairs.forEach((index, item) {
        item.status = Status.none;
        item.selected = false;
      });
      pairs.clear();
      validated = false;
    });
  }

  Future<void> _showDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("alert"),
          content: SingleChildScrollView(
            child: Text("You have Successfully changed Button Tab order."),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }
}

enum Status { none, correct, wrong }

class Buttons {
  final int id;
  final String buttonName;

  bool _selected = false;

  bool get selected => _selected;

  void set selected(bool value) {
    _selected = value;
    if (_selected == false) status = Status.none;
  }

  Status status;

  Buttons(this.id, this.buttonName, {this.status: Status.none});

  @override
  String toString() {
    return 'Item{id: $id, buttonName: $buttonName,'
        ' selected: $selected, status: $status}';
  }
}

class DraggableButton extends StatefulWidget {
  final Buttons item;
  final Size size;

  bool enabled = true;
  DraggableButton(this.item, {this.size});

  @override
  _DraggableButtonState createState() => new _DraggableButtonState();
}

class _DraggableButtonState extends State<DraggableButton> {
  Widget onDragAvatarBorder() {
    return new DragAvatarBorder(
      new Material(
        elevation: 0.0,
        child: new Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: new Text(
              widget.item.buttonName,
              style: new TextStyle(
                  color: Colors.blue.shade100,
                  fontSize: 12.0,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
          ),
        ]),
      ),
      size: widget.size,
      color: Colors.white,
    );
  }

  Widget createContainer() {
    return new Container(
        width: widget.size.width,
        height: widget.size.height,
        // color: widget.item.selected ? border : white,
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey, style: BorderStyle.solid, width: 1.0)),
        child: new Material(
            elevation: 0.0,
            child: new Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: new Text(
                      widget.item.buttonName,
                      style: new TextStyle(
                          color: Colors.blue.shade100,
                          fontSize: 12.0,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ))
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding: new EdgeInsets.all(2.0),
        child: new Draggable<Buttons>(
            onDraggableCanceled: (velocity, offset) {
              setState(() {
                widget.item.selected = true; // draggable cancel color change
                widget.item.status = Status.none;
              });
            },
            childWhenDragging: onDragAvatarBorder(),
            child: createContainer(),
            data: widget.item,
            feedback: new DragAvatarBorder(
              new Material(
                elevation: 0.0,
                child: new Column(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: new Text(
                      widget.item.buttonName,
                      style: new TextStyle(
                          color: Colors.blue.shade100,
                          fontSize: 12.0,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ]),
              ),
              size: widget.size,
              color: Colors.white,
            )));
  }
}

class DragAvatarBorder extends StatelessWidget {
  final Color color;
  final double scale;
  final double opacity;
  final Widget child;
  final Size size;

  DragAvatarBorder(this.child,
      {this.color, this.scale: 1.0, this.opacity: 1.0, @required this.size});

  @override
  Widget build(BuildContext context) => new Opacity(
      opacity: opacity,
      child: new Container(
        transform: new Matrix4.identity()..scale(scale),
        width: size.width,
        height: size.height,
        color: color ?? Colors.white,
        child: new Center(child: child),
      ));
}

typedef void DropItemSelector(Buttons item, DropTarget target);

class SelectionNotification extends Notification {
  final int dropIndex;
  final Buttons item;
  final bool cancel;

  SelectionNotification(this.dropIndex, this.item, {this.cancel: false});
}

class DropTarget extends StatefulWidget {
  final Buttons item;

  final Size size;
  final Size itemSize;

  Buttons _selection;

  Buttons get selection => _selection;

  get id => item.id;

  set selection(Buttons value) {
    clearSelection();
    _selection = value;
  }

  DropTarget(this.item, {this.size, Buttons selectedItem, this.itemSize}) {
    _selection = selectedItem;
  }

  @override
  _DropTargetState createState() => new _DropTargetState();

  void clearSelection() {
    if (_selection != null) _selection.selected = false;
  }
}

class _DropTargetState extends State<DropTarget> {
  static const double kFingerSize = 50.0;

  @override
  Widget build(BuildContext context) {
    print("_DropTargetState");
    return new Padding(
        padding: new EdgeInsets.all(4.0),
        child: widget.selection != null
            ? Container(
                child: addDraggable(getTarget()),
              )
            : getTarget());
  }

  Widget addDraggable(DragTarget target) => new Draggable<Buttons>(
      data: widget.selection,
      dragAnchor: DragAnchor.pointer,
      onDraggableCanceled: onDragCancelled,
      feedback: getCenteredAvatar(),
      child: target);

  DragTarget getTarget() => new DragTarget<Buttons>(
      onWillAccept: (item) => widget.selection != item,
      onAccept: (value) {
        new SelectionNotification(widget.item.id, value).dispatch(context);
      },
      builder: (BuildContext context, List<Buttons> accepted,
          List<dynamic> rejected) {
        return new SizedBox(
            child: new Container(
                width: 80.0, //
                height: widget.size.height,
                child: widget.selection != null
                    ? new Column(children: [
                        new Center(
                            child: new SizedBox(
                                width: widget.itemSize.width,
                                height: widget.itemSize.height,
                                child: new Material(
                                    elevation: 1.0,
                                    child: new Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(top: 5.0),
                                          child: new Container(
                                              color: Colors.white,
                                              // target selected color
                                              child: Center(
                                                child: new Text(
                                                  widget.selection.buttonName,
                                                  style: new TextStyle(
                                                    color: Colors.blue.shade100,
                                                    fontSize: 12.0,
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              )),
                                        )
                                      ],
                                    )))),
                      ])
                    : new Center(child: new Text(""))));
      });

  void onDragCancelled(Velocity velocity, Offset offset) {
    print("onDragCancelled");
    setState(() {
      widget.selection = null;
      new SelectionNotification(widget.item.id, widget.selection, cancel: true)
          .dispatch(context);
    });
  }

  Widget getCenteredAvatar() => new Transform(
      transform: new Matrix4.identity()
        ..translate(-100.0 / 2.0, -(100.0 / 2.0)),
      child: new DragAvatarBorder(
        new Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: new Text(
              widget.selection?.buttonName,
              style: new TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ]),
        size: widget.itemSize,
        color: Colors.white,
      ));
}
