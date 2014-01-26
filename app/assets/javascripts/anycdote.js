window.onload = function() {
	
	function ImageDiv(path, ttl, lnk, txt) {
		this.path = path;  		// Filepath for image
		this.ttl = ttl;			// Title for overlay
		this.lnk = lnk; //anything? Preferabily a link to the pinteris 
		this.txt = txt;			// Text for overlay
	}

	var imgDir = "../images/";  
	
	var div1 = new ImageDiv(imgDir + "0.jpg","location?", "hfjdlk", "fjsdlkfd");
	var div2 = new ImageDiv(imgDir + "1.jpg", "locaion?", "lof", "fdslkfjsdlfjdsf.");
	var div3 = new ImageDiv(imgDir + "2.jpg", "location?", "another?", "fdjsfjsldf");
	var div4 = new ImageDiv(imgDir + "3.jpg", "location?", "fd", "fdjklfajslfjsffsfd");
	var div5 = new ImageDiv(imgDir + "4.jpg", "location?", "another?",  "fadskfjasdlfdsf");
	var div6 = new ImageDiv(imgDir + "5.jpg", "location?", "another?", "dsc.");
	var div7 = new ImageDiv(imgDir + "6.jpg", "location?", "another?", "desc");
	var div8 = new ImageDiv(imgDir + "7.jpg", "location?", "another?", "desc");
	var div9 = new ImageDiv(imgDir + "8.jpg", "location?", "another?", "desc");
	var div10 = new ImageDiv(imgDir + "9.jpg", "location?", "another?", "desc");
	var div11 = new ImageDiv(imgDir + "10.jpg", "location?", "another?", "desc");
	var div13 = new ImageDiv(imgDir + "11.jpg", "location?", "another?", "desc");
	// Array of the above ImageDiv objects
	var divArray = new Array(div1, div2, div3, div4, div5, div6, div7, div8, div9, div10, div11, div13);
	// Get reference to the main container div that holds images
	var mainCont = document.getElementById('anycdote');
	var overlayBox = document.getElementById('overlayBox');
	var overlay = document.getElementById('overlay');
	
	// This function places the images in the HTML
	function makeGallery(arr, div) {
		for (var i = 0; i != arr.length; i++) {
			var imgDiv = document.createElement('div');		
			imgDiv.className = 'holder';						
			var imgTag = document.createElement('img');			
			imgTag.src = arr[i].path;						
			imgTag.height = 150;								
			imgTag.width = 200;
			imgDiv.appendChild(imgTag);							
			div.appendChild(imgDiv);							

			arr[i].div = imgDiv;								

			clickHandler(arr[i]);
		};
	}


	function createOverlay(obj) {
		var imageTag = document.createElement('img');				
		imageTag.src = obj.path;									
		imageTag.height = 300;								
		imageTag.width = 400;
		var titleTag = document.createElement('a');			
		titleTag.href = obj.lnk;									
		titleTag.innerHTML = obj.ttl;
		var captionTag = document.createElement('p');				
		var textNode  = document.createTextNode(obj.txt);	
		captionTag.appendChild(textNode);						
		overlayBox.appendChild(imageTag);					
		overlayBox.appendChild(titleTag);							
		overlayBox.appendChild(captionTag);						
	}

	function clickHandler(obj) {
		obj.div.onclick = function() {
			createOverlay(obj);
			overlay.style.display = 'block';
			overlayBox.style.display = 'block';
		}
		overlay.onclick = function() {
			overlay.style.display = 'none';
			overlayBox.style.display = 'none';
			overlayBox.innerHTML = '';
		}
	}
	
	makeGallery(divArray, mainCont);

};