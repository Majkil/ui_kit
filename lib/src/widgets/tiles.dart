part of ui_kit;

class IconTileButton extends StatelessWidget {
  final Icon icon;
  final String textContent;

  const IconTileButton(
      {Key? key, required this.icon, required this.textContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
            ),
            BoxShadow(
              offset: Offset(-1, -1),
              color: Colors.black,
            ),
            BoxShadow(
              offset: Offset(1, 1),
              color: Colors.black,
            )
          ]),
      child: Column(
        children: [
          icon,
          Text(
            textContent,
          )
        ],
      ),
    );
  }
}

class FeaturedFullSizeImageTile extends StatelessWidget {
  final String imgUrl;
  final Function() onTap;
  final String route;
  final String captionTextContent;
  final String mainTextContent;

  const FeaturedFullSizeImageTile(
      {Key? key,
      required this.imgUrl,
      required this.route,
      required this.mainTextContent,
      required this.captionTextContent,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.8,
        child: Container(
          clipBehavior: Clip.hardEdge,
          margin: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Flex(
            direction: Axis.vertical,
            // mainAxisSize: MainAxisSize.max,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Image.network(
                  imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      mainTextContent,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                              color: Theme.of(context).colorScheme.onSecondary),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SquareImageTile extends StatelessWidget {
  final double dimension;
  final String imageUrl;
  final String? text;
  final Function() onTap;
  const SquareImageTile(
      {Key? key,
      required this.dimension,
      required this.imageUrl,
      required this.onTap,
      this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide.none,
          ),
          fixedSize: Size(dimension, dimension)),
      onPressed: onTap,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        width: dimension,
        height: dimension,
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            Image.network(
              imageUrl,
              colorBlendMode: BlendMode.overlay,
              fit: BoxFit.cover,
              width: dimension,
              height: dimension,
            ),
            if (text != null)
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text!,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        backgroundColor: Colors.white.withOpacity(0.6)),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

class SquareHalfImageTile extends StatelessWidget {
  final double dimension;
  final String imageUrl;
  final String? text;
  final Function() onTap;
  const SquareHalfImageTile(
      {Key? key,
      required this.dimension,
      required this.imageUrl,
      this.text,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide.none,
          ),
          fixedSize: Size(dimension, dimension)),
      onPressed: onTap,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        width: dimension,
        height: dimension,
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            Image.network(
              imageUrl,
              colorBlendMode: BlendMode.overlay,
              fit: BoxFit.cover,
              width: dimension,
              height: dimension * 0.7,
            ),
            if (text != null)
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text!,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

class ElongatedImageTileWithText extends StatelessWidget {
  final double width;
  final double height;
  final String imageUrl;
  final String? text;
  final Function() onTap;
  const ElongatedImageTileWithText(
      {Key? key,
      required this.width,
      required this.height,
      required this.imageUrl,
      this.text,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          width: width,
          height: height,
          clipBehavior: Clip.hardEdge,
          child: Stack(
            children: [
              Image.network(
                imageUrl,
                colorBlendMode: BlendMode.overlay,
                fit: BoxFit.cover,
                width: width,
                height: height * 0.85,
              ),
              if (text != null)
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      text!,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class ListTileWithDoubleValueListener extends StatelessWidget {
  final ValueListenable<double> listenable;
  final Function(double) onChanged;
  final String title;

  const ListTileWithDoubleValueListener(
      {Key? key,
      required this.listenable,
      required this.onChanged,
      required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title, style: listTileTextStyle(context)),
        trailing: ValueListenableBuilder<double>(
          valueListenable: listenable,
          builder: (context, value, child) => SizedBox(
            width: 50,
            height: 50,
            child: TextFormField(
              initialValue: "${listenable.value}",
              selectionWidthStyle: BoxWidthStyle.tight,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (value) => onChanged(double.parse(value)),
            ),
          ),
        ));
  }
}

class ListTileWithSwitchValueListener extends StatelessWidget {
  final ValueListenable<bool> listenable;
  final Function(bool) onChanged;
  final String title;
  const ListTileWithSwitchValueListener(
      {Key? key,
      required this.listenable,
      required this.onChanged,
      required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MaterialStateProperty<Color> thumbColor =
        MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return Theme.of(context).colorScheme.background;
      } else {
        return Theme.of(context).colorScheme.primary;
      }
    });

    final MaterialStateProperty<Color> trackColor =
        MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return Theme.of(context).colorScheme.primary;
      } else {
        return Colors.transparent;
      }
    });

    return ListTile(
        title: Text(
          title,
          style: listTileTextStyle(context),
        ),
        trailing: ValueListenableBuilder<bool>(
          valueListenable: listenable,
          builder: (context, listenableValue, child) => Switch.adaptive(
            trackColor: trackColor,
            activeTrackColor: Theme.of(context).colorScheme.primary,
            trackOutlineColor: thumbColor,
            // MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
            trackOutlineWidth: MaterialStateProperty.all(2),
            thumbColor: thumbColor,
            value: listenableValue,
            onChanged: onChanged,
          ),
        ));
  }
}

class ListTileWithBoolValueListenerHighlightSelected extends StatelessWidget {
  final ValueListenable<bool> valueListenable;
  final Function() onChanged;
  final String title;
  final Widget? leading;

  const ListTileWithBoolValueListenerHighlightSelected(
      {Key? key,
      required this.valueListenable,
      required this.onChanged,
      required this.title,
      this.leading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tileHeight = verticalViewHeight(context) / 10;
    return ValueListenableBuilder<bool>(
        valueListenable: valueListenable,
        builder: (context, selected, child) {
          return InkWell(
            onTap: onChanged,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: (8)),
              padding:
                  const EdgeInsets.symmetric(horizontal: (35), vertical: (16)),
              decoration: BoxDecoration(
                  color: selected
                      ? Theme.of(context).colorScheme.primaryContainer
                      : Colors.transparent,
                  borderRadius: BorderRadius.all(
                      Radius.circular(getScreenPercentSize(context, 1.5))),
                  border: Border.all(
                      color: selected
                          ? Colors.transparent
                          : Theme.of(context).colorScheme.onBackground,
                      width: 1.5)),
              height: tileHeight,
              child: Row(
                children: [
                  if (leading != null)
                    LayoutBuilder(builder: (context, constraints) => leading!),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Text(
                      title.capitalizeFirstLetter(),
                      style: TextStyle(
                          color: selected
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.onBackground,
                          fontSize: tileHeight / 4,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class ListTileWithIntegerValueListener extends StatelessWidget {
  final ValueListenable<int> listenable;
  final Function(int) onChanged;
  final String title;
  const ListTileWithIntegerValueListener(
      {Key? key,
      required this.listenable,
      required this.onChanged,
      required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          title,
          style: listTileTextStyle(context),
        ),
        trailing: ValueListenableBuilder<int>(
            valueListenable: listenable,
            builder: (context, listenableValue, child) => FormField(
                  initialValue: 2000,
                  builder: (field) {
                    return const TextField(
                      selectionWidthStyle: BoxWidthStyle.tight,
                    );
                  },
                )));
  }
}

class ListTileWithDropdownEnumValueListener<T extends Enum>
    extends StatelessWidget {
  final ValueListenable<T> valueListenable;
  final void Function(T) onChanged;
  final String title;
  final Widget? leading;
  final List<T> enumValues;

  const ListTileWithDropdownEnumValueListener(
      {Key? key,
      required this.valueListenable,
      required this.onChanged,
      required this.title,
      this.leading,
      required this.enumValues})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          title,
          style: listTileTextStyle(context),
        ),
        trailing: ValueListenableBuilder<T>(
          valueListenable: valueListenable,
          builder: (context, selectedThemeMode, child) => DropdownButton<T>(
            value: valueListenable.value,
            items: enumValues
                .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e.name.capitalizeFirstLetter(),
                      style: listTileTextStyle(context),
                    )))
                .toList(),
            onChanged: (mode) => onChanged(mode!),
          ),
        ));
  }
}

class ListTileLink extends StatelessWidget {
  final String targetUrl;
  final String textContent;
  final Function() onTap;

  const ListTileLink(
      {Key? key,
      required this.targetUrl,
      required this.textContent,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(textContent, style: listTileTextStyle(context)),
        ),
      ),
    );
  }
}

class HeroTile extends StatelessWidget {
  final String title;
  final String body;
  final String imageUrl;

  const HeroTile(
      {Key? key,
      required this.title,
      required this.body,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.40,
            child: LayoutBuilder(
              builder: (context, constraints) => Stack(
                children: [
                  SizedBox(
                      height: constraints.maxHeight * 0.65,
                      child: Image.network(imageUrl)),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: constraints.maxHeight * 0.48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                    constraints.maxHeight * 0.1)),
                            color: Theme.of(context).colorScheme.surface),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: constraints.maxHeight * 0.1),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(body,
                                  textAlign: TextAlign.justify,
                                  softWrap: true,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [Text('2 months ago')],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
