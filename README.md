# lopdfの話

2018-08-01のイベント、[Rust LT #2 〜いま使う！Rust〜](https://rust.connpass.com/event/91177/)でのLT「lopdfの話」の資料です。

## 概要

[VersaType](http://trim-marks.com)での表示・変換を前提にしています。VersaTypeの前身Vivliostyleの[オープンソース版](https://vivliostyle.org)でも表示は可能です。

## 内容

slide-nora.txt
:   ソースファイル。[Noramark](https://github.com/skoji/noramark)。

slide-nora-transformer.rb
:   Noramark用のマークアップカスタマイズ

slide-nora_001.xhtml
:   変換後のHTML。（XHTMLになっているのは、NoramarkがEPUBをメインのターゲットにしていたのが理由）

slide.pdf
:   VersaType Converterで変換したPDF

## ビルド・表示方法

### ビルド

```
bundle install
rake
```

### 表示（Vivliostyle利用）

```
sh prepare-vivliostyle.sh # オープンソース版の最新vivliostyle 2017.6をダウンロード
ruby webserver.rb # 0.0.0.0:8000でWebサーバ起動
```

[0.0.0.0:8000の指定URL](http://0.0.0.0:8000/vivliostyle-js-2017.6/viewer/vivliostyle-viewer.html#x=http://0.0.0.0:8000/slide-nora_001.xhtml&spread=false)で`slide-nora_001.xhtml`表示。mac + Chromeでは以下のスクリプトで表示できる。

```
sh open-chrome.sh
```

### PDF生成（要VersaType Converter）

```
versatype-converter --with-bookmarks http://0.0.0.0:8000/slide-nora_001.xhtml --output=slide.pdf
```

