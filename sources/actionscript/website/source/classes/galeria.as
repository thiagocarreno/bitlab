﻿package classes{	import flash.display.Sprite;	import flash.display.MovieClip;	import flash.events.Event;		import com.esouza.effects.Fade;	import com.esouza.load.LoadXML;	import com.esouza.load.LoadIMG;	import com.esouza.math.GalleryWidthIrregular;		import caurina.transitions.Tweener;		public class galeria extends Sprite	{		private var lxml:LoadXML;		private var limg:LoadIMG;		private var mc:MovieClip;		private var mc_galeria:MovieClip;		private var n:uint = 0;		private var gwi:GalleryWidthIrregular;		private var xml:XML;				public function galeria( _mc:MovieClip ):void		{			mc = _mc;						mc_galeria = new MovieClip();			mc_galeria.x = 20;			mc_galeria.y = 56;			mc.addChild( mc_galeria );						init();		}				private function init():void		{			gwi = new GalleryWidthIrregular();			gwi.imageHeight = 150;			gwi.marginX = 26;			gwi.marginY = 20;			gwi.widthTotal = dGlobal.obj["stage_width"] - 40;						lxml = new LoadXML( 'xml/galeria.xml' );			lxml.addEventListener( Event.COMPLETE, loaded );		}				private function loaded( evt:Event ):void		{			xml = XML( lxml.data );						loadThumb();		}				private function loadThumb():void		{			limg = new LoadIMG( xml.img[ n ].@source );						limg.addEventListener( "LOADED", imgLoaded );						limg.start();		}				private function imgLoaded( evt:Event ):void		{			var dim:Object = gwi.add( limg.ld.width );						var thumb:Sprite = new Sprite();			thumb.x = dim.px;			thumb.y = dim.py;			thumb.alpha = 0;						Fade.mouseInOut( thumb );						thumb.addChild( limg.ld );						mc_galeria.addChild( thumb );						Tweener.addTween( thumb, { alpha: 1, time: 1 } );						if( ++n < xml.img.length() ) loadThumb();		}	}}