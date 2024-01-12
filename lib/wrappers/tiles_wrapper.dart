part of ui_kit;

class UiTile {
  static SquareImageTile squareImage(
          {required double dimension,
          required String imageUrl,
          required Function() onTap}) =>
      SquareImageTile(
        dimension: dimension,
        imageUrl: imageUrl,
        onTap: onTap,
      );

  static IconTileButton iconButton(
          {required Icon icon, required String textContent}) =>
      IconTileButton(icon: icon, textContent: textContent);

  static FeaturedFullSizeImageTile featuredFullSizeImageTile(String imgUrl,
          {required String route,
          required String mainTextContent,
          required String captionTextContent,
          required Function() onTap}) =>
      FeaturedFullSizeImageTile(
        imgUrl: imgUrl,
        route: route,
        mainTextContent: mainTextContent,
        captionTextContent: captionTextContent,
        onTap: onTap,
      );

  static SquareHalfImageTile squareHalfImageTile(
          {required double dimension,
          required String imageUrl,
          required Function() onTap}) =>
      SquareHalfImageTile(
          dimension: dimension, imageUrl: imageUrl, onTap: onTap);

  static ElongatedImageTileWithText elongatedImageTileWithText(
          {required double width,
          required double height,
          required String imageUrl,
          required Function() onTap}) =>
      ElongatedImageTileWithText(
          width: width,
          height: height,
          imageUrl: imageUrl,
          onTap: onTap);

  static HeroTile heroTile(String title, String body, String imageUrl) =>
      HeroTile(
        body: body,
        title: title,
        imageUrl: imageUrl,
      );
}
