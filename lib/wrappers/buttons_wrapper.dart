part of ui_kit;

class UiButtons {
  static MomentaryNeumorphicButton momentaryNeumorphicButton(
          {Key? key,
          required indentedPush,
          required buttonAction,
          required backgroundColor,
          required contents}) =>
      MomentaryNeumorphicButton(
          indentedPush: indentedPush,
          buttonAction: buttonAction,
          backgroundColor: backgroundColor,
          contents: contents);

  static ToggleableNeumorphicButton toggleableNeumorphicButton(
          {Key? key,
          required buttonAction,
          required contents,
          required backgroundColor}) =>
      ToggleableNeumorphicButton(
          buttonAction: buttonAction,
          contents: contents,
          backgroundColor: backgroundColor);
}
