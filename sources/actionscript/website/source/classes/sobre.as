﻿package classes{	import flash.display.Sprite;	import flash.display.MovieClip;	import flash.events.Event;		import com.esouza.load.LoadXML;	import com.esouza.load.LoadIMG;		import caurina.transitions.Tweener;		public class sobre extends Sprite	{		private var lxml:LoadXML;		private var limg:LoadIMG;		private var mc:MovieClip;		private var xml:XML;				public function sobre( _mc:MovieClip ):void		{			mc = _mc;						init();		}				private function init():void		{			lxml = new LoadXML( 'xml/sobre.xml' );			lxml.addEventListener( Event.COMPLETE, loaded );		}				private function loaded( evt:Event ):void		{			xml = XML( lxml.data );						limg = new LoadIMG( xml.img[0].@source );			limg.ld.y = 56;						limg.addEventListener( "LOADED", imgLoaded );						mc.addChild( limg.ld );						limg.start();		}				private function imgLoaded( evt:Event ):void		{			limg.ld.x = dGlobal.obj["stage_width"] - limg.ld.width - 20;			limg.ld.alpha = 0;			Tweener.addTween( limg.ld, { alpha: 1, time: 1 } );						addText();		}				private function addText():void		{			var item:itemTexto = new itemTexto();			item.texto.multiline = true;			item.texto.wordWrap = true;			item.texto.width = 450;			item.texto.text = xml.texto[0];						item.x = 20;			item.y = 56;						mc.addChild( item );						item.alpha = 0;			Tweener.addTween( item, { alpha: 1, time: .8 } );		}	}}