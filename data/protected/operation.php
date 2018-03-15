<?php

	Class operation {
		public function __construct(){
			// if (session_status() == PHP_SESSION_NONE) {session_start();} // session start
			if (session_id() == '') { session_start(); }
			require_once('protected/config.php');
			$this->db = openGate();
		}

		public function requestData($post, $target){
			switch($target){
				case "summary" 			: $resultList = $this->summary(); break;

				case "product" 				: $resultList = $this->fetchAllRequest('products p LEFT JOIN products_variant v ON p.idData = v.productId LEFT JOIN categories c ON p.categoryId = c.idData', array("DISTINCT p.idData", "(SELECT x.frontPicture FROM products_variant x WHERE x.productId = p.idData ORDER BY x.idData DESC LIMIT 1) as frontPicture", "p.name", "p.description", "p.status", "c.name as category", "p.highlight"), $post['keyword'], "ORDER BY p.name ASC", $post['page']); break;
				case "productGroup" 	: $resultList = $this->fetchAllRecord('products p LEFT JOIN products_variant v ON p.idData = v.productId LEFT JOIN categories c ON p.categoryId = c.idData',
																array("DISTINCT p.idData", "p.highlight",
																"(SELECT x.frontPicture FROM products_variant x WHERE x.productId = p.idData AND x.status != '0' AND ".str_replace("\\",'', $post['keyword'])." ORDER BY x.idData DESC LIMIT 1) as frontPicture",
																"p.name",
																"c.idData as categoryId",
																"c.name as category",
																"(SELECT x.price FROM products_variant x WHERE x.productId = p.idData ORDER BY x.idData ASC LIMIT 1) as price"), str_replace("\\",'', $post['keyword']), "ORDER BY p.highlight DESC, c.name ASC, p.name ASC"); break;
				case "productFetch" 	: $resultList = $this->fetchSingleRequest('products', array("idData", "name", "description", "material", "categoryId", "status", "lookBook1", "lookBook2"), $post['keyword']); break;
				// case "productDetail" 	: $resultList = $this->fetchSingleRequest('products', array("lookBook1", "lookBook2", "idData", "sku", "name", "description", "price", "material", "dimension", "storyId"), $post['keyword']); break;
				case "productDetail" 	: $resultList = $this->fetchSingleRequest(
																'products p JOIN products_variant v ON p.idData = v.productId JOIN cms_story s ON v.storyId = s.idData',
																array("DISTINCT v.idData", "v.qty",
																"substring_index(group_concat(v.frontPicture SEPARATOR ','), ',', 1) as frontPicture",
																"substring_index(group_concat(v.backPicture SEPARATOR ','), ',', 1) as backPicture",
																"substring_index(group_concat(v.topPicture SEPARATOR ','), ',', 1) as topPicture",
																"substring_index(group_concat(v.rightPicture SEPARATOR ','), ',', 1) as rightPicture",
																"substring_index(group_concat(v.leftPicture SEPARATOR ','), ',', 1) as leftPicture",
																"substring_index(group_concat(v.bottomPicture SEPARATOR ','), ',', 1) as bottomPicture",
																"substring_index(group_concat(v.storyId SEPARATOR ','), ',', 1) as storyId",
																"substring_index(group_concat(v.artworkId SEPARATOR ','), ',', 1) as artworkId",
																"substring_index(group_concat(v.price SEPARATOR ','), ',', 1) as price",
																"substring_index(group_concat(v.dimension SEPARATOR ','), ',', 1) as dimension",
																"substring_index(group_concat(v.sku SEPARATOR ','), ',', 1) as sku",
																"p.name", "p.description", "p.material", "p.lookBook1", "p.lookBook2", "s.title", "s.subtitle"), $post['keyword']); break;

				case "productList" 		: $resultList = $this->fetchAllRecord('products p LEFT JOIN products_variant v ON p.idData = v.productId LEFT JOIN categories c ON p.categoryId = c.idData',
																array("DISTINCT p.idData", "p.highlight",
																"p.name",
																"c.idData as categoryId",
																"c.name as category"), str_replace("\\",'', $post['keyword']), "ORDER BY c.name ASC, p.name ASC"); break;

				case "productCart" 	: $resultList = $this->fetchAllRequest('products p JOIN products_variant v ON p.idData = v.productId',array("DISTINCT v.idData", "v.qty", "v.frontPicture","p.name", "v.price", "p.sku"), $post['keyword'], "ORDER BY v.idData", $post['page']); break;

				case "productVariant" 			: $resultList = $this->fetchAllRequest('products p JOIN products_variant v ON p.idData = v.productId LEFT JOIN cms_story_artwork a ON v.artworkId = a.idData LEFT JOIN colors c ON v.colorId = c.idData', array("v.idData", "p.name", "v.qty", "v.size", "v.frontPicture", "a.name as artwork", "c.name as color", "v.price", "v.sku", "v.status"), $post['keyword'], "ORDER BY v.artWorkId ASC", $post['page']); break;
				case "productVariantFetch" 	: $resultList = $this->fetchSingleRequest('products_variant', array("frontPicture", "backPicture", "topPicture", "rightPicture", "bottomPicture", "leftPicture", "idData", "qty", "size", "storyId", "colorId", "artworkId", "price", "dimension", "sku"), $post['keyword']); break;
				case "productStoryOption" 	: $resultList = $this->fetchAllRecord('products_variant v JOIN cms_story a ON v.storyId = a.idData', array("DISTINCT a.title as caption", "a.idData as value"), $post['keyword'], "ORDER BY v.idData ASC"); break;
				case "productArtworkOption" : $resultList = $this->fetchAllRecord('products_variant v JOIN cms_story_artwork a ON v.artworkId = a.idData', array("DISTINCT a.name as caption", "a.idData as value"), $post['keyword'], "ORDER BY v.idData ASC"); break;
				case "productColorOption" 	: $resultList = $this->fetchAllRecord('products_variant v JOIN colors a ON v.colorId = a.idData', array("DISTINCT a.name as caption", "a.idData as value"), $post['keyword'], "ORDER BY v.idData ASC"); break;
				case "productSizeOption" 		: $resultList = $this->fetchAllRecord('products_variant v', array("DISTINCT v.size as caption", "v.size as value"), $post['keyword'], "ORDER BY v.idData ASC"); break;
				// case "productVariantDetail" 	: $resultList = $this->fetchSingleRequest('products', array("frontPicture", "backPicture", "topPicture", "rightPicture", "bottomPicture", "leftPicture", "lookBook1", "lookBook2", "idData", "sku", "name", "description", "price", "material", "dimension", "storyId"), $post['keyword']); break;

				case "countryOption" 	: $resultList = $this->fetchAllRecord('countries', array("DISTINCT country_name as caption", "country_code as value"), $post['keyword'], "ORDER BY country_name ASC"); break;

				case "colorFilter" 		: $resultList = $this->fetchAllRecord('colors c JOIN products_variant v ON c.idData = v.colorId', array("DISTINCT c.name", "c.idData"), 'v.qty > 0 and v.price is not null and v.price  <> "NaN"', "ORDER BY name ASC"); break;
				case "color" 					: $resultList = $this->fetchAllRequest('colors', array("name", "idData"), $post['keyword'], "ORDER BY name ASC", $post['page']); break;
				case "colorOption" 		: $resultList = $this->fetchAllRecord('colors', array("name as caption", "idData as value"), $post['keyword'], "ORDER BY name ASC"); break;
				case "colorFetch" 		: $resultList = $this->fetchSingleRequest('colors', array("name", "idData"), $post['keyword']); break;

				case "category" 					: $resultList = $this->fetchAllRequest('categories', array("name", "idData"), $post['keyword'], "ORDER BY name ASC", $post['page']); break;
				case "categoryOption" 		: $resultList = $this->fetchAllRecord('categories', array("name as caption", "idData as value"), $post['keyword'], "ORDER BY name ASC"); break;
				case "categoryFetch" 		: $resultList = $this->fetchSingleRequest('categories', array("name", "idData"), $post['keyword']); break;

				case "shippingOption" 			: $resultList = $this->fetchAllRequest('shipping_options', array("name", "link", "idData"), $post['keyword'], "ORDER BY name ASC", $post['page']); break;
				case "shippingOptionList"		: $resultList = $this->fetchAllRecord('shipping_options', array("name as caption", "idData as value"), $post['keyword'], "ORDER BY name ASC"); break;
				case "shippingOptionFetch" 	: $resultList = $this->fetchSingleRequest('shipping_options', array("name", "link", "idData"), $post['keyword']); break;

				case "department" 		: $resultList = $this->fetchAllRequest('departments', array("name", "idData"), $post['keyword'], "ORDER BY name ASC", $post['page']); break;
				case "departmentOption" : $resultList = $this->fetchAllRecord('departments', array("name as caption", "idData as value"), $post['keyword'], "ORDER BY name ASC"); break;
				case "departmentFetch" 	: $resultList = $this->fetchSingleRequest('departments', array("name", "idData"), $post['keyword']); break;

				case "customer" 		: $resultList = $this->fetchAllRequest('customers c LEFT JOIN countries y ON c.country = y.country_code', array("idData", "name", "company", "phone", "email", "CONCAT(address, '</br>', city, ' ', zipCode, '</br>', country_name) as address", "COALESCE(userId,'guest')"), $post['keyword'], "ORDER BY name ASC", $post['page']); break;
				case "customerFetch" 	: $resultList = $this->fetchSingleRequest('customers c LEFT JOIN users u ON c.userId = u.idData', array("c.idData", "c.name", "c.company", "c.phone", "c.email", "c.address", "c.city", "c.zipCode", "c.country, u.picture"), $post['keyword']); break;

				case "cms_blog" 		: $resultList = $this->fetchAllRequest('cms_blog', array("idData","title", "date", "subtitle", "description", "photoBy", "pictures", "link", "caption", "publishDate"), $post['keyword'], "ORDER BY idData DESC", $post['page']); break;
				case "cms_blogFetch" 	: $resultList = $this->fetchSingleRequest('cms_blog', array("idData","title", "date", "subtitle", "description", "photoBy", "pictures as `pictures[]`", "link as filename", "caption", "publishDate"), $post['keyword']); break;
				case "cms_blogDetail" 	: $resultList = $this->fetchSingleRequest('cms_blog', array("idData","title", "date", "subtitle", "description", "photoBy", "pictures as pictures", "link", "caption", "publishDate"), $post['keyword']); break;

				case "cms_chatter" 		: $resultList = $this->fetchAllRequest('cms_chatter', array("idData","title", "date", "description","picture", "type", "createdBy as publishedBy", "createdDate as publishedTime"), $post['keyword'], "ORDER BY idData DESC", $post['page']); break;
				case "cms_chatterFetch" : $resultList = $this->fetchSingleRequest('cms_chatter', array("idData","title", "date", "description","picture", "type"), $post['keyword']); break;

				case "cms_home" 		: $resultList = $this->fetchAllRequest('cms_home', array("idData", "title", "description", "picture", "pictureMobile", "createdBy as publishedBy", "createdDate as publishedTime"), $post['keyword'], "ORDER BY idData ASC", $post['page']); break;
				case "cms_homeFetch": $resultList = $this->fetchSingleRequest('cms_home', array("idData", "title", "description", "picture", "pictureMobile"), $post['keyword']); break;

				case "cms_home_gallery" 		: $resultList = $this->fetchAllRequest('cms_home_gallery', array("idData", "description", "thumbnail","link"), $post['keyword'], "ORDER BY idData DESC", $post['page']); break;
				case "cms_home_galleryFetch": $resultList = $this->fetchSingleRequest('cms_home_gallery', array("idData", "description", "thumbnail as picture", "link"), $post['keyword']); break;

				case "cms_story" 				: $resultList = $this->fetchAllRequest('cms_story', array("idData","title", "subtitle", "description", "author", "picture", "status"), $post['keyword'], "ORDER BY idData DESC", $post['page']); break;
				case "cms_storyOption" 	: $resultList = $this->fetchAllRecord('cms_story', array("title as caption", "idData as value"), $post['keyword'], "ORDER BY title ASC"); break;
				case "cms_storyFetch" 	: $resultList = $this->fetchSingleRequest('cms_story', array("idData", "title", "subtitle", "description", "author", "picture"), $post['keyword']); break;

				case "artWork" 					: $resultList = $this->fetchAllRequest('cms_story_artwork a JOIN cms_story s ON a.idStory = s.idData', array("a.name", "a.idData", "s.title"), $post['keyword'], "ORDER BY a.name ASC", $post['page']); break;
				case "artWorkOption" 		: $resultList = $this->fetchAllRecord('cms_story_artwork', array("name as caption", "idData as value"), $post['keyword'], "ORDER BY name ASC"); break;
				case "artWorkFetch" 		: $resultList = $this->fetchSingleRequest('cms_story_artwork', array("name", "idData", "idStory"), $post['keyword']); break;

				case "cms_video" 		: $resultList = $this->fetchAllRequest('cms_video', array("idData","title", "description", "fileName", "fileSize", "createdBy as publishedBy", "createdDate as publishedTime"), $post['keyword'], "ORDER BY idData DESC", $post['page']); break;
				case "cms_videoFetch" 	: $resultList = $this->fetchSingleRequest('cms_video', array("idData","title", "description", "fileName", "createdDate as publish"), $post['keyword']); break;

				case "store" 			: $resultList = $this->fetchAllRequest('store s LEFT JOIN countries y ON s.country = y.country_code', array("s.idData", "s.name", "s.picture", "s.type","s.address", "s.city", "s.zipCode", "country_name", "phone", "openHours"), $post['keyword'], "ORDER BY idData ASC", $post['page']); break;
				case "storeFetch"			: $resultList = $this->fetchSingleRequest('store', array("idData", "name", "picture","address", "city", "zipCode", "country", "phone", "openHours", "type"), $post['keyword']); break;

				case "user" 			: $resultList = $this->fetchAllRequest('users u LEFT JOIN departments d ON u.departmentId = d.idData', array("u.idData","u.name", "u.username", "u.type", "IFNULL(d.name,'') as department", "u.picture"), "u.idData <> '0'", "ORDER BY u.idData DESC", $post['page']); break;
				case "userFetch" 		: $resultList = $this->fetchSingleRequest('users', array("idData","name", "username", "type", "departmentId", "picture"), $post['keyword']); break;

				case "vendor" 			: $resultList = $this->fetchAllRequest('vendors', array("idData", "name", "company", "phone", "email", "CONCAT(address, '</br>', city, ' ', zipCode, '</br>', country) as address"), $post['keyword'], "ORDER BY name ASC", $post['page']); break;
				case "vendorFetch" 		: $resultList = $this->fetchSingleRequest('vendors', array("idData", "name", "company", "phone", "email", "address", "city", "zipCode", "country"), $post['keyword'], "ORDER BY name ASC"); break;

				case "media" 				: $resultList = $this->fetchAllRequest('media', array("idData","title", "type", "file_1", "file_2"), $post['keyword'], "ORDER BY idData DESC", $post['page']); break;
				case "mediaGroup" 	: $resultList = $this->fetchAllRequest('media', array("idData","title", "type", "file_1", "file_2"), $post['keyword'], "ORDER BY type ASC, idData DESC", $post['page']); break;
				case "mediaFetch" 	: $resultList = $this->fetchSingleRequest('media', array("idData", "title", "type", "file_1", "file_2"), $post['keyword']); break;

				case "about" 				: $resultList = $this->fetchAllRequest('about', array("idData","title", "description", "type", "picture"), $post['keyword'], "ORDER BY idData DESC", $post['page']); break;
				case "aboutFetch" 	: $resultList = $this->fetchSingleRequest('about', array("idData","title", "description", "type", "picture"), $post['keyword']); break;

				default	   : $resultList = array( "feedStatus" => "failed", "feedType" => "danger", "feedMessage" => "Something went wrong, failed to collect data!", "feedData" => array()); break;
			}

			/* result fetch */
			$json = $resultList;

	        return $json;
		}

		public function removeData($post, $target){
			switch($target){
				case "product" 						: $resultList = $this->deleteById('products', $post['id']); break;
				case "productVariant" 		: $resultList = $this->deleteById('products_variant', $post['id']); break;
				case "category" 					: $resultList = $this->deleteById('categories', $post['id']); break;
				case "color" 							: $resultList = $this->deleteById('colors', $post['id']); break;
				case "shippingOption" 		: $resultList = $this->deleteById('shipping_options', $post['id']); break;
				case "department" 				: $resultList = $this->deleteById('departments', $post['id']); break;
				case "customer" 					:
					if(isset($post['id'])){
						$temp  = "";
						foreach ($post['id'] as $value) {
							if($temp  == "") $temp = $value;
							else $temp = $temp.",".$value;
						}

						$resultList = $this->fetchAllRecord('customers', array("userId"), "idData IN (".$temp.")");
						if($resultList['feedStatus'] == "success"){
							$data = $resultList['feedData'];
							foreach ($data as $value) {
								$userResult = $this->deleteById('users', $value['userId']);
								$resultList = $this->deleteById('customers', $post['id']);
								$resultList['userFeed'] = $userResult;
							}
						}
					}
				break;
				case "vendor" 		: $resultList = $this->deleteById('vendors', $post['id']); break;
				case "order" 		: $resultList = $this->deleteById('orders', $post['id']); break;
				case "user" 		: $resultList = $this->deleteById('users', $post['id']); break;
				case "cms_blog" 	: $resultList = $this->deleteById('cms_blog', $post['id']); break;
				case "cms_chatter" 	: $resultList = $this->deleteById('cms_chatter', $post['id']); break;
				case "cms_home" 	: $resultList = $this->deleteById('cms_home', $post['id']); break;
				case "cms_home_gallery" 	: $resultList = $this->deleteById('cms_home_gallery', $post['id']); break;
				case "cms_story" 	: $resultList = $this->deleteById('cms_story', $post['id']); break;
				case "artWork" 		: $resultList = $this->deleteById('cms_story_artwork', $post['id']); break;
				case "cms_video" 	: $resultList = $this->deleteById('cms_video', $post['id']); break;
				case "store" 	: $resultList = $this->deleteById('store', $post['id']); break;
				case "media" 	: $resultList = $this->deleteById('media', $post['id']); break;
				case "about" 	: $resultList = $this->deleteById('about', $post['id']); break;

				default	   : $resultList = array( "feedStatus" => "failed", "feedType" => "danger", "feedMessage" => "Something went wrong, failed to collect data!", "feedData" => array()); break;
			}

			/* result fetch */
			$json = $resultList;

	        return $json;
		}

		public function addData($post, $target){
			switch($target){
				case "product"  :
					$fields = array("name", "material", "categoryId", "status");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "";
						array_push($values, $value);
					}

					if(isset($post['description'])) {
						array_push($fields, "description");
						array_push($values, str_replace("'","\'",$post['description']));
					}

					$resultList = $this->insert('products', $fields, $values);

					if($resultList["feedStatus"] == "success") {

						if(isset($_FILES["lookBook1"])){
							$upload = $this->uploadZoomImage($_FILES["lookBook1"], "products", "products", "lookBook1", $resultList["feedId"], '7');
							array_push($resultList, array("feedUpload" => $upload['feedMessage']));
						}

						if(isset($_FILES["lookBook2"])){
							$upload = $this->uploadZoomImage($_FILES["lookBook2"], "products", "products", "lookBook2", $resultList["feedId"], '8');
							array_push($resultList, array("feedUpload" => $upload['feedMessage']));
						}
					}
				break;

				case "productVariant"  :
					$fields = array("sku", "qty", "size", "artworkId", "colorId", "storyId", "productId", "price");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? str_replace(',','',$post[$key]) : "";
						array_push($values, $value);
					}

					if(isset($post['dimension'])) {
						array_push($fields, "dimension");
						array_push($values, base64_encode($post['dimension']));
					}

					$resultList = $this->insert('products_variant', $fields, $values);

					if($resultList["feedStatus"] == "success") {
						if(isset($_FILES["frontPicture"])){
							$upload = $this->uploadZoomImage($_FILES["frontPicture"], "products", "products_variant", "frontPicture", $resultList["feedId"], '1');
							array_push($resultList, array("feedUpload" => $upload['feedMessage']));
						}

						if(isset($_FILES["backPicture"])){
							$upload = $this->uploadZoomImage($_FILES["backPicture"], "products", "products_variant", "backPicture", $resultList["feedId"], '2');
							array_push($resultList, array("feedUpload" => $upload['feedMessage']));
						}

						if(isset($_FILES["topPicture"])){
							$upload = $this->uploadZoomImage($_FILES["topPicture"], "products", "products_variant", "topPicture", $resultList["feedId"], '3');
							array_push($resultList, array("feedUpload" => $upload['feedMessage']));
						}

						if(isset($_FILES["rightPicture"])){
							$upload = $this->uploadZoomImage($_FILES["rightPicture"], "products", "products_variant", "rightPicture", $resultList["feedId"], '4');
							array_push($resultList, array("feedUpload" => $upload['feedMessage']));
						}

						if(isset($_FILES["bottomPicture"])){
							$upload = $this->uploadZoomImage($_FILES["bottomPicture"], "products", "products_variant", "bottomPicture", $resultList["feedId"], '5');
							array_push($resultList, array("feedUpload" => $upload['feedMessage']));
						}

						if(isset($_FILES["leftPicture"])){
							$upload = $this->uploadZoomImage($_FILES["leftPicture"], "products", "products_variant", "leftPicture", $resultList["feedId"], '6');
							array_push($resultList, array("feedUpload" => $upload['feedMessage']));
						}
					}
				break;

				case "color"  :
					$fields = array("name");
					$values = array($post["name"]);

					$resultList = $this->insert('colors', $fields, $values);
				break;

				case "category"  :
					$fields = array("name");
					$values = array($post["name"]);

					$resultList = $this->insert('categories', $fields, $values);
				break;

				case "shippingOption"  :
					$fields = array("name", "link");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "";
						array_push($values, $value);
					}

					$resultList = $this->insert('shipping_options', $fields, $values);
				break;

				case "department"  :
					$fields = array("name");
					$values = array($post["name"]);

					$resultList = $this->insert('departments', $fields, $values);
				break;

				case "cms_home"  :
					$fields = array("title", "description");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "";
						array_push($values, $value);
					}

					$resultList = $this->insert('cms_home', $fields, $values);

					if($resultList["feedStatus"] == "success") {
						if(isset($_FILES["picture"])){
							$upload = $this->uploadSingleImage($_FILES["picture"], "home", "cms_home", "picture", $resultList["feedId"], '1');
							array_push($resultList, array("feedUpload" => $upload['feedMessage']));
						}

						if(isset($_FILES["pictureMobile"])){
							$upload = $this->uploadSingleImage($_FILES["pictureMobile"], "home", "cms_home", "pictureMobile", $resultList["feedId"], '2');
							array_push($resultList, array("feedUpload" => $upload['feedMessage']));
						}
					}
				break;

				case "cms_home_gallery"  :
					$fields = array("description", "link");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? str_replace("'", "\'", $post[$key]) : "";
						array_push($values,$value);
					}

					$resultList = $this->insert('cms_home_gallery', $fields, $values);

					if($resultList["feedStatus"] == "success") {
						if(isset($_FILES["picture"])){
							$upload = $this->uploadSingleImage($_FILES["picture"], "homeGallery", "cms_home_gallery", "thumbnail", $resultList["feedId"]);
							array_push($resultList, array("feedUpload" => $upload['feedMessage']));
						}
					}
				break;

				case "cms_story"  :
					$fields = array("title", "subtitle", "author");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "";
						array_push($values, $value);
					}

					if(isset($post['description'])) {
						array_push($fields, "description");
						array_push($values, htmlspecialchars($post['description']));
					}

					$resultList = $this->insert('cms_story', $fields, $values);

					if($resultList["feedStatus"] == "success") {
						if(isset($_FILES["picture"])){
							$upload = $this->uploadSingleImage($_FILES["picture"], "stories", "cms_story", "picture", $resultList["feedId"]);
							array_push($resultList, array("feedUpload" => $upload['feedMessage']));
						}
					}
				break;

				case "artWork"  :
					$fields = array("name", "idStory");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "";
						array_push($values, $value);
					}

					$resultList = $this->insert('cms_story_artwork', $fields, $values);
				break;

				case "cms_blog"  :
					$fields = array("title", "date", "subtitle", "photoBy", "caption", "publishDate");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "";
						array_push($values, $value);
					}

					if(isset($post['description'])) {
						array_push($fields, "description");
						array_push($values, base64_encode($post['description']));
					}

					$resultList = $this->insert('cms_blog', $fields, $values);

					if($resultList["feedStatus"] == "success") {
						if(isset($_FILES["pictures"])){
							$upload = $this->uploadMultiImage($_FILES["pictures"], "blogs", "cms_blog", "pictures", $resultList['feedId']);
							$resultList["feedMultiUpload"] = $upload['feedMessage'];
						}

						if(isset($_FILES["link"]) && isset($post['caption']) && $post['caption'] != ""){
							$upload = $this->uploadFile($_FILES["link"], "blogs/attachment", "cms_blog", "link", $resultList['feedId'], $post['caption']);
							$resultList["feedUploadFile"] = $upload['feedMessage'];
						}
					}
				break;

				case "cms_chatter"  :
					$fields = array("title", "date", "description", "type");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "";
						array_push($values, $value);
					}

					$resultList = $this->insert('cms_chatter', $fields, $values);

					if($resultList["feedStatus"] == "success") {
						if(isset($_FILES["picture"])){
							$upload = $this->uploadSingleImage($_FILES["picture"], "chatters", "cms_chatter", "picture", $resultList["feedId"]);
							array_push($resultList, array("feedUpload" => $upload['feedMessage']));
						}
					}
				break;

				case "cms_video"  :
					$fields = array("title","fileName");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "";
						array_push($values, $value);
					}

					if(isset($post['description'])) {
						array_push($fields, "description");
						array_push($values, base64_encode($post['description']));
					}

					$resultList = $this->insert('cms_video', $fields, $values);

					// if($resultList["feedStatus"] == "success") {
					// 	// if(isset($_FILES["video"])){
					// 	// 	$upload = $this->uploadSingleVideo($_FILES["video"], "videos", "cms_video", "fileName", $resultList['feedId']);
					// 	// 	$resultList["feedMultiUpload"] = $upload['feedMessage'];
					// 	// }
					// }
				break;

				case "store"  :
					$fields = array("name", "city", "country", "zipCode", "phone", "openHours", "type");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? str_replace("'", "\'", $post[$key]) : "";
						array_push($values,$value);
					}

					if(isset($post['address'])) {
						array_push($fields, "address");
						array_push($values, base64_encode($post['address']));
					}

					$resultList = $this->insert('store', $fields, $values);

					if($resultList["feedStatus"] == "success") {
						if(isset($_FILES["picture"])){
							$upload = $this->uploadSingleImage($_FILES["picture"], "store", "store", "picture", $resultList["feedId"]);
							array_push($resultList, array("feedUpload" => $upload['feedMessage']));
						}
					}
				break;

				case "user"  :
					$fields = array("name", "username", "departmentId");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "";
						array_push($values, $value);
					}

					if(isset($post['password']) && isset($post['retype_password']) && $post['password'] == $post['retype_password']) {
						array_push($fields, "password");
						array_push($values, md5($post['password']));
					}

					array_push($fields, "type");
					array_push($values, "admin");

					$resultList = $this->insert('users', $fields, $values);

					if($resultList["feedStatus"] == "success") {
						if(isset($_FILES["picture"])){
							$upload = $this->uploadSingleImage($_FILES["picture"], "users", "users", "picture", $resultList["feedId"]);
							array_push($resultList, array("feedUpload" => $upload['feedMessage']));
						}
					}
				break;

				case "customer"  :
					//create user first
					$fields = array();
					$values = array();
					$userId = "";

					if(isset($post['name'])) {
						array_push($fields, "name");
						array_push($values, $post['name']);
					}

					if(isset($post['email'])) {
						array_push($fields, "username");
						array_push($values, $post['email']);
					}

					if(isset($post['password']) && isset($post['retype_password']) && $post['password'] == $post['retype_password']) {
						array_push($fields, "password");
						array_push($values, md5($post['password']));
					}

					array_push($fields, "type");
					array_push($values, "Customer");

					$resultList = $this->insert('users', $fields, $values);

					if($resultList["feedStatus"] == "success") {

						//create customer
						$fields = array("name","address", "city", "country", "zipCode", "phone", "email", "company");
						$values = array();
						foreach ($fields as $key) {
							$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "";
							array_push($values, $value);
						}

						if(isset($resultList["feedId"])) {
							$userId = $resultList["feedId"];
							array_push($fields, "userId");
							array_push($values, $userId);
						}

						$resultList = $this->insert('customers', $fields, $values);

						if($resultList["feedStatus"] == "success") {
							if(isset($_FILES["picture"])){
								$upload = $this->uploadSingleImage($_FILES["picture"], "users", "users", "picture", $userId);
								array_push($resultList, array("feedUpload" => $upload['feedMessage']));
							}
						}
					}
				break;

				case "vendor"  :
					$fields = array("name", "company", "phone", "email", "address", "city", "zipCode", "country");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "";
						array_push($values, $value);
					}

					$resultList = $this->insert('vendors', $fields, $values);
				break;

				case "media"  :
					$fields = array("title", "type");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "";
						array_push($values, $value);
					}

					$resultList = $this->insert('media', $fields, $values);

					if($resultList["feedStatus"] == "success") {
						if(isset($_FILES["file_1"])){
							$upload = $this->uploadFile($_FILES["file_1"], "media", "media", "file_1", $resultList['feedId'], $post['title']."1");
							$resultList["feedUploadFile1"] = $upload['feedMessage'];
						}

						if(isset($_FILES["file_2"])){
							$upload = $this->uploadFile($_FILES["file_2"], "media", "media", "file_2", $resultList['feedId'], $post['title']."2");
							$resultList["feedUploadFile2"] = $upload['feedMessage'];
						}
					}
				break;

				case "about"  :
					$fields = array("title", "type");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "";
						array_push($values, $value);
					}

					if(isset($post['description'])) {
						array_push($fields, "description");
						array_push($values, base64_encode($post['description']));
					}

					$resultList = $this->insert('about', $fields, $values);

					if($resultList["feedStatus"] == "success") {
						if(isset($_FILES["picture"])){
							$upload = $this->uploadSingleImage($_FILES["picture"], "about", "about", "picture", $resultList["feedId"]);
							array_push($resultList, array("feedUpload" => $upload['feedMessage']));
						}
					}
				break;

				default	   		: $resultList = array( "feedStatus" => "failed", "feedType" => "danger", "feedMessage" => "Something went wrong, failed to collect data!", "feedData" => array()); break;
			}

			/* result fetch */
			$json = $resultList;

	        return $json;
		}

		public function updateData($post, $target){
			switch($target){
				case "product"  :
					$fields = array("name", "material", "categoryId", "status");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "";
						$values[$key] = $key." = '".str_replace(',','',$value)."'";
					}

					if(isset($post['description'])) {
						$values['description'] = "description = '".str_replace("'","\'",$post['description'])."'";
					}

					if(isset($post['lookBook1_removed']) && $post['lookBook1_removed'] == "yes"){
						$values['lookBook1'] = "lookBook1 = ''";
					}

					if(isset($post['lookBook2_removed']) && $post['lookBook2_removed'] == "yes"){
						$values['lookBook2'] = "lookBook2 = ''";
					}

					$resultList = $this->update('products', $values, $post['idData']);

					if($resultList["feedStatus"] == "success" && isset($post['idData']) && $post['idData']!="") {
						if(isset($_FILES["lookBook1"])){
							$upload = $this->uploadSingleImage($_FILES["lookBook1"], "products", "products", "lookBook1", $post['idData'], '1');
							array_push($resultList, array("feedUpload" => $upload['feedMessage']));
						}

						if(isset($_FILES["lookBook2"])){
							$upload = $this->uploadSingleImage($_FILES["lookBook2"], "products", "products", "lookBook2", $post['idData'], '2');
							array_push($resultList, array("feedUpload" => $upload['feedMessage']));
						}
					}

				break;

				case "addHighlightProduct"  :
					$values = array("highlight = 1");
					$resultList = $this->updateMultiData('products', $values, $post['pId']);
				break;

				case "removeHighlightProduct"  :
					$values = array("highlight = 0");
					$resultList = $this->updateMultiData('products', $values, $post['pId']);
				break;

				case "productVariant"  :
					$fields = array("sku", "qty", "size", "storyId", "artworkId", "colorId", "price");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "";
						$values[$key] = $key." = '".str_replace(',','',$value)."'";
					}

					if(isset($post['frontPicture_removed']) && $post['frontPicture_removed'] == "yes"){
						$values['frontPicture'] = "frontPicture = ''";
					}

					if(isset($post['backPicture_removed']) && $post['backPicture_removed'] == "yes"){
						$values['backPicture'] = "backPicture = ''";
					}

					if(isset($post['topPicture_removed']) && $post['topPicture_removed'] == "yes"){
						$values['topPicture'] = "topPicture = ''";
					}

					if(isset($post['rightPicture_removed']) && $post['rightPicture_removed'] == "yes"){
						$values['rightPicture'] = "rightPicture = ''";
					}

					if(isset($post['bottomPicture_removed']) && $post['bottomPicture_removed'] == "yes"){
						$values['bottomPicture'] = "bottomPicture = ''";
					}

					if(isset($post['leftPicture_removed']) && $post['leftPicture_removed'] == "yes"){
						$values['leftPicture'] = "leftPicture = ''";
					}


					if(isset($post['dimension'])) {
						$values['dimension'] = "dimension = '".htmlspecialchars($post['dimension'])."'";
					}

					$resultList = $this->update('products_variant', $values, $post['idData']);

					if($resultList["feedStatus"] == "success" && isset($post['idData']) && $post['idData']!="") {
						if(isset($_FILES["frontPicture"])){
							$upload = $this->uploadZoomImage($_FILES["frontPicture"], "products", "products_variant", "frontPicture", $post["idData"], '1');
							array_push($resultList, array("feedUpload" => $upload['feedMessage']));
						}

						if(isset($_FILES["backPicture"])){
							$upload = $this->uploadZoomImage($_FILES["backPicture"], "products", "products_variant", "backPicture", $post["idData"], '2');
							array_push($resultList, array("feedUpload" => $upload['feedMessage']));
						}

						if(isset($_FILES["topPicture"])){
							$upload = $this->uploadZoomImage($_FILES["topPicture"], "products", "products_variant", "topPicture", $post["idData"], '3');
							array_push($resultList, array("feedUpload" => $upload['feedMessage']));
						}

						if(isset($_FILES["rightPicture"])){
							$upload = $this->uploadZoomImage($_FILES["rightPicture"], "products", "products_variant", "rightPicture", $post["idData"], '4');
							array_push($resultList, array("feedUpload" => $upload['feedMessage']));
						}

						if(isset($_FILES["bottomPicture"])){
							$upload = $this->uploadZoomImage($_FILES["bottomPicture"], "products", "products_variant", "bottomPicture", $post["idData"], '5');
							array_push($resultList, array("feedUpload" => $upload['feedMessage']));
						}

						if(isset($_FILES["leftPicture"])){
							$upload = $this->uploadZoomImage($_FILES["leftPicture"], "products", "products_variant", "leftPicture", $post["idData"], '6');
							array_push($resultList, array("feedUpload" => $upload['feedMessage']));
						}
					}

				break;

				case "color"  :
					$values = array("name = '".$post["name"]."'");
					$resultList = $this->update('colors', $values, $post['idData']);
				break;

				case "category"  :
					$values = array("name = '".$post["name"]."'");
					$resultList = $this->update('categories', $values, $post['idData']);
				break;

				case "shippingOption"  :
					$values = array("name = '".$post["name"]."', link = '".$post["link"]."'");
					$resultList = $this->update('shipping_options', $values, $post['idData']);
				break;

				case "department"  :
					$values = array("name = '".$post["name"]."'");
					$resultList = $this->update('departments', $values, $post['idData']);
				break;

				case "cms_home"  :
					$fields = array("title", "description");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "";
						$values[$key] = $key." = '".str_replace(',','',$value)."'";
					}

					$resultList = $this->update('cms_home', $values, $post['idData']);

					if($resultList["feedStatus"] == "success" && isset($post['idData']) && $post['idData']!="") {
						if(isset($_FILES["picture"])){
							$upload = $this->uploadSingleImage($_FILES["picture"], "home", "cms_home", "picture", $post['idData'], "1");
							$resultList["feedUpload"] = $upload['feedMessage'];
						}

						if(isset($_FILES["pictureMobile"])){
							$upload = $this->uploadSingleImage($_FILES["pictureMobile"], "home", "cms_home", "pictureMobile", $post['idData'], "2");
							$resultList["feedUpload"] = $upload['feedMessage'];
						}
					}

				break;

				case "cms_home_gallery"  :
					$fields = array("description", "link");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? str_replace("'", "\'", $post[$key]) : "";
						$values[$key] = $key." = '".str_replace(',','',$value)."'";
					}

					$resultList = $this->update('cms_home_gallery', $values, $post['idData']);

					if($resultList["feedStatus"] == "success" && isset($post['idData']) && $post['idData']!="") {
						if(isset($_FILES["picture"])){
							$upload = $this->uploadSingleImage($_FILES["picture"], "homeGallery", "cms_home_gallery", "thumbnail", $post['idData']);
							$resultList["feedUpload"] = $upload['feedMessage'];
						}
					}

				break;

				case "cms_story"  :
					$fields = array("title", "subtitle", "author");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "";
						$values[$key] = $key." = '".str_replace(',','',$value)."'";
					}

					if(isset($post['description'])) {
						$values['description'] = "description = '".base64_encode($post['description'])."'";
					}

					$resultList = $this->update('cms_story', $values, $post['idData']);

					if($resultList["feedStatus"] == "success" && isset($post['idData']) && $post['idData']!="") {
						if(isset($_FILES["picture"])){
							$upload = $this->uploadSingleImage($_FILES["picture"], "stories", "cms_story", "picture", $post['idData']);
							$resultList["feedUpload"] = $upload['feedMessage'];
						}
					}

				break;

				case "publishStory"  :
					$values = array("status = 1");
					$resultList = $this->updateMultiData('cms_story', $values, $post['pId']);
				break;

				case "keepStory"  :
					$values = array("status = 0");
					$resultList = $this->updateMultiData('cms_story', $values, $post['pId']);
				break;

				case "artWork"  :
					$values = array("name = '".$post["name"]."'");
					$resultList = $this->update('cms_story_artwork', $values, $post['idData']);
				break;

				case "cms_blog"  :
					$fields = array("title", "date", "subtitle", "photoBy", "caption", "publishDate");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "";
						$values[$key] = $key." = '".str_replace(',','',$value)."'";
					}

					if(isset($post['description'])) {
						$values['description'] = "description = '".base64_encode($post['description'])."'";
					}

					$resultList = $this->update('cms_blog', $values, $post['idData']);

					if($resultList["feedStatus"] == "success" && isset($post['idData']) && $post['idData']!="") {
						if(isset($_FILES["pictures"])){
							$upload = $this->uploadMultiImage($_FILES["pictures"], "blogs", "cms_blog", "pictures", $post['idData']);
							$resultList["feedMultiUpload"] = $upload['feedMessage'];
						}

						if(isset($_FILES["link"])){
							$upload = $this->uploadFile($_FILES["link"], "blogs/attachment", "cms_blog", "link", $post['idData'], $post['caption']);
							$resultList["feedUploadFile"] = $upload['feedMessage'];
						}

					}

				break;

				case "cms_chatter"  :
					$fields = array("title", "date", "description", "type");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "";
						$values[$key] = $key." = '".str_replace(',','',$value)."'";
					}

					$resultList = $this->update('cms_chatter', $values, $post['idData']);

					if($resultList["feedStatus"] == "success" && isset($post['idData']) && $post['idData']!="") {
						if(isset($_FILES["picture"])){
							$upload = $this->uploadSingleImage($_FILES["picture"], "chatters", "cms_chatter", "picture", $post['idData']);
							$resultList["feedUpload"] = $upload['feedMessage'];
						}
					}

				break;

				case "cms_video"  :
					$fields = array("title", "fileName");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "";
						$values[$key] = $key." = '".str_replace(',','',$value)."'";
					}

					if(isset($post['description'])) {
						$values['description'] = "description = '".base64_encode($post['description'])."'";
					}

					$resultList = $this->update('cms_video', $values, $post['idData']);

					// if($resultList["feedStatus"] == "success" && isset($post['idData']) && $post['idData']!="") {
					// 	if(isset($_FILES["video"])){
					// 		$upload = $this->uploadSingleVideo($_FILES["video"], "videos", "cms_video", "fileName", $post['idData']);
					// 		$resultList["feedMultiUpload"] = $upload['feedMessage'];
					// 	}
          //
					// }

				break;

				case "store"  :
					$fields = array("name", "city", "country", "zipCode", "phone", "openHours", "type");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? str_replace("'", "\'", $post[$key]) : "";
						$values[$key] = $key." = '".str_replace(',','',$value)."'";
					}

					if(isset($post['address'])) {
						$values['address'] = "address = '".base64_encode($post['address'])."'";
					}

					$resultList = $this->update('store', $values, $post['idData']);

					if($resultList["feedStatus"] == "success" && isset($post['idData']) && $post['idData']!="") {
						if(isset($_FILES["picture"])){
							$upload = $this->uploadSingleImage($_FILES["picture"], "store", "store", "picture", $post['idData']);
							$resultList["feedUpload"] = $upload['feedMessage'];
						}
					}

				break;

				case "user"  :
					$fields = array("name", "departmentId");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "";
						$values[$key] = $key." = '".str_replace(',','',$value)."'";
					}

					if(isset($post['password']) && isset($post['retype_password']) && $post['password'] == $post['retype_password']) {
						$values['password'] = "password = '".md5($post['password'])."'";
					}

					$resultList = $this->update('users', $values, $post['idData']);

					if($resultList["feedStatus"] == "success" && isset($post['idData']) && $post['idData']!="") {
						if(isset($_FILES["picture"])){
							$upload = $this->uploadSingleImage($_FILES["picture"], "users", "users", "picture", $post['idData']);
							$resultList["feedMultiUpload"] = $upload['feedMessage'];
						}

					}

				break;

				case "customer"  :

					//update user first
					$fields = array("name");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "";
						$values[$key] = $key." = '".str_replace(',','',$value)."'";
					}

					if(isset($post['password']) && isset($post['retype_password']) && $post['password'] == $post['retype_password']) {
						$values['password'] = "password = '".md5($post['password'])."'";
					}

					$resultList = $this->update('users', $values, $post['idData']);

					if($resultList["feedStatus"] == "success" && isset($post['idData']) && $post['idData']!="") {
						if(isset($_FILES["picture"])){
							$upload = $this->uploadSingleImage($_FILES["picture"], "users", "users", "picture", $post['idData']);
							$resultList["feedMultiUpload"] = $upload['feedMessage'];
						}


						//update customer
						$fields = array("name","address", "city", "country", "zipCode", "phone", "company");
						$values = array();
						foreach ($fields as $key) {
							$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "";
							$values[$key] = $key." = '".str_replace(',','',$value)."'";
						}

						$resultList = $this->update('customers', $values, $post['idData']);
					}

				break;

				case "vendor"  :
					$fields = array("name", "company", "phone", "email", "address", "city", "zipCode", "country");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "";
						$values[$key] = $key." = '".str_replace(',','',$value)."'";
					}

					$resultList = $this->update('vendors', $values, $post['idData']);
				break;

				case "accountUpdate"  :

					//update user first
					$fields = array("name");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "";
						$values[$key] = $key." = '".str_replace(',','',$value)."'";
					}

					if(isset($post['password']) && isset($post['retype_password']) && $post['password'] == $post['retype_password']) {
						$values['password'] = "password = '".md5($post['password'])."'";
					}

					$resultList = $this->update('users', $values, $post['idData']);

					if($resultList["feedStatus"] == "success" && isset($post['idData']) && $post['idData']!="") {
						if(isset($_FILES["picture"])){
							$upload = $this->uploadSingleImage($_FILES["picture"], "users", "users", "picture", $post['idData']);
							$resultList["feedMultiUpload"] = $upload['feedMessage'];
						}


						//update customer
						$fields = array("name","address", "city", "country", "zipCode", "phone", "company");
						$values = array();
						foreach ($fields as $key) {
							$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "";
							$values[$key] = $key." = '".str_replace(',','',$value)."'";
						}

						$resultList = $this->update('customers', $values, $post['idData']);
					}

				break;

				case "publishVariant"  :
					$values = array("status = '1'");
					$resultList = $this->updateMultiData('products_variant', $values, $post['pId']);
				break;

				case "keepVariant"  :
					$values = array("status = '0'");
					$resultList = $this->updateMultiData('products_variant', $values, $post['pId']);
				break;

				case "media"  :
					$fields = array("title", "type");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "";
						$values[$key] = $key." = '".str_replace(',','',$value)."'";
					}

					$resultList = $this->update('media', $values, $post['idData']);

					if($resultList["feedStatus"] == "success" && isset($post['idData']) && $post['idData']!="") {
						if(isset($_FILES["file_1"])){
							$upload = $this->uploadFile($_FILES["file_1"], "media", "media", "file_1", $post['idData'], $post['title']."1");
							$resultList["feedUploadFile"] = $upload['feedMessage'];
						}

						if(isset($_FILES["file_2"])){
							$upload = $this->uploadFile($_FILES["file_2"], "media", "media", "file_2", $post['idData'], $post['title']."2");
							$resultList["feedUploadFile"] = $upload['feedMessage'];
						}

					}

				break;

				case "about"  :
					$fields = array("title", "type");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "";
						$values[$key] = $key." = '".str_replace(',','',$value)."'";
					}

					if(isset($post['description'])) {
						$values['description'] = "description = '".base64_encode($post['description'])."'";
					}

					$resultList = $this->update('about', $values, $post['idData']);

					if($resultList["feedStatus"] == "success" && isset($post['idData']) && $post['idData']!="") {
						if(isset($_FILES["picture"])){
							$upload = $this->uploadSingleImage($_FILES["picture"], "about", "about", "picture", $post['idData']);
							$resultList["feedUpload"] = $upload['feedMessage'];
						}
					}

				break;

				default	   		: $resultList = array( "feedStatus" => "failed", "feedType" => "danger", "feedMessage" => "Something went wrong, failed to collect data!", "feedData" => array()); break;
			}

			/* result fetch */
			$json = $resultList;

	        return $json;
		}

		public function cloneData($post, $target){
			switch($target){
				case "product" 	: $resultList = $this->duplicateById($post['id']); break;

				default	   : $resultList = array( "feedStatus" => "failed", "feedType" => "danger", "feedMessage" => "Something went wrong, failed to collect data!", "feedData" => array()); break;
			}

			/* result fetch */
			$json = $resultList;

					return $json;
		}

		public function fetchAllRecord($table, $fields, $conditions = "", $orderBy = ""){
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Something went wrong, failed to collect data!";
			$feedData	= array();

			$temp		= "";

			/* open connection */
			$gate = $this->db;
			if($gate){

				if(is_array($fields)) {
					foreach ($fields as $value) {
						if($temp  == "") $temp = $value;
						else $temp = $temp.",".$value;
					}

					$fields = $temp;
					$temp   = "";
				}

				if(is_array($conditions)) {
					foreach ($conditions as $value) {
						$temp = $temp." ".$value;
					}

					$conditions = $temp;
					$temp   = "";
				}

				$conditions = ($conditions != "") ? "WHERE ".str_replace('\\', '', $conditions) : "";


				$sql = "SELECT ".$fields." FROM ".$table." ".$conditions." ".$orderBy." ";

				$result = $this->db->query($sql);
				if($result){
					$feedStatus	= "success";
					$feedType   = "success";
					$feedMessage= "The process has been successful";
					$feedData = $result->fetchAll(PDO::FETCH_ASSOC);
				}

				$feedType = $sql;
			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData);

			/* result fetch */
			$json = $resultList;

			return $json;
		}

		public function fetchAllRequest($table, $fields, $conditions = "", $orderBy = "", $paging = "1", $pageSize = 20){
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Something went wrong, failed to collect data!";
			$feedData	= array();

			$temp		= "";

			/* open connection */
			$gate = $this->db;
			if($gate){

				if(is_array($fields)) {
					foreach ($fields as $value) {
						if($temp  == "") $temp = $value;
						else $temp = $temp.",".$value;
					}

					$fields = $temp;
					$temp   = "";
				}

				if(is_array($conditions)) {
					foreach ($conditions as $value) {
						$temp = $temp." ".$value;
					}

					$conditions = $temp;
					$temp   = "";
				}

				$conditions = ($conditions != "") ? "WHERE ".str_replace('\\', '', $conditions) : "";


				$temp = intval($paging);
				$temp = ($temp - 1) * $pageSize;

				$paging = "LIMIT ".$temp.",".$pageSize;

				$sql = "SELECT ".$fields." FROM ".$table." ".$conditions." ".$orderBy." ".$paging;

				$result = $this->db->query($sql);
				if($result){
					$feedStatus	= "success";
					$feedType   = "success";
					$feedMessage= "The process has been successful";
					$feedData = $result->fetchAll(PDO::FETCH_ASSOC);
				}

				$feedType = $sql;
			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData);

			/* result fetch */
			$json = $resultList;

			return $json;
		}

		public function fetchSingleRequest($table, $fields, $conditions = ""){
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Something went wrong, failed to collect data!";
			$feedData	= array();

			$temp		= "";

			/* open connection */
			$gate = $this->db;
			if($gate){

				if(is_array($fields)) {
					foreach ($fields as $value) {
						if($temp  == "") $temp = $value;
						else $temp = $temp.",".$value;
					}

					$fields = $temp;
					$temp   = "";
				}

				if(is_array($conditions)) {
					foreach ($conditions as $value) {
						$temp = $temp." ".$value;
					}

					$conditions = $temp;
					$temp   = "";
				}

				$conditions = ($conditions != "") ? "WHERE ".str_replace('\\', '', $conditions) : "";

				$sql = "SELECT ".$fields." FROM ".$table." ".$conditions;

				$result = $this->db->query($sql);
				if($result){
					$feedStatus	= "success";
					$feedType   = "success";
					$feedMessage= "The process has been successful";
					$feedData = $result->fetch(PDO::FETCH_ASSOC);
				}

					$feedType = $sql;
			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData);

			/* result fetch */
			$json = $resultList;

			return $json;
		}

		public function summary(){
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Something went wrong, failed to collect data!";
			$feedData	= array();

			$temp		= "";

			/* open connection */
			$gate = $this->db;
			if($gate){

				$sql =
				" 	SELECT * FROM (
						SELECT 'Orders' as `group`, COUNT(idData) as total FROM orders
						UNION
						SELECT 'Products' as `group`, COUNT(idData) as total FROM products
						UNION
						SELECT 'Customers' as `group`, COUNT(idData) as total FROM customers
						UNION
						SELECT 'Vendors' as `group`, COUNT(idData) as total FROM vendors
						UNION
						SELECT 'Users' as `group`, COUNT(idData) as total FROM users
					) AS table_generate
				";

				$result = $this->db->query($sql);
				if($result){
					$feedStatus	= "success";
					$feedType   = "success";
					$feedMessage= "The process has been successful";
					$feedData = $result->fetchAll(PDO::FETCH_ASSOC);
				}
			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData);

			/* result fetch */
			$json = $resultList;

			return $json;
		}


		// DELETE DATA
		public function deleteById($table, $conditions, $image = null){
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Something went wrong, failed to collect data!";
			$feedData	= array();

			$temp		= "";

			/* open connection */
			$gate = $this->db;
			if($gate){

				if(is_array($conditions)) {
					foreach ($conditions as $value) {
						if($temp  == "") $temp = $value;
						else $temp = $temp.",".$value;
					}

					$conditions = $temp;
					$temp   = "";
				}

				$sql = "DELETE FROM ".$table." WHERE idData IN (".$conditions.")";

				$result = $this->db->query($sql);
				if($result){
					$feedStatus	= "success";
					$feedType   = "success";
					$feedMessage= "The process has been successful";
					$feedData   = $conditions;
				}

				$feedType = $sql;
			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData);

			/* result fetch */
			$json = $resultList;

			return $json;
		}


		//INSERT DATA
		public function insert($table, $fields, $values){
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Something went wrong, failed to collect data!";
			$feedData	= array();
			$feedId		= "";

			$temp		= "";

			/* open connection */
			$gate = $this->db;
			if($gate){

				if(is_array($fields)) {
					foreach ($fields as $item) {
						if($temp  == "") $temp = $item;
						else $temp = $temp.",".$item;
					}

					$fields = $temp;
					$temp   = "";
				}

				if(is_array($values)) {
					foreach ($values as $item) {
						if($temp  == "") $temp = "'".$item."'";
						else $temp = $temp.",'".$item."'";
					}

					$values = $temp;
					$temp   = "";
				}

				$sql = "INSERT INTO ".$table."(".$fields.", createdBy, createdDate) VALUES (".$values.", '".$_SESSION['tulisan_user_username']."',NOW())";

				$result = $this->db->query($sql);
				if($result){
					$feedStatus	= "success";
					$feedType   = "success";
					$feedMessage= "The process has been successful";
					$feedId 	= $this->db->lastInsertId();
				}

				$feedType = $sql;
			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData, "feedId" => $feedId);

			/* result fetch */
			$json = $resultList;

			return $json;

		}

		//UPDATE DATA
		public function update($table, $values, $id){
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Something went wrong, failed to collect data!";
			$feedData	= array();
			$feedId		= "";

			$temp		= "";

			/* open connection */
			$gate = $this->db;
			if($gate){

				if(is_array($values)) {
					foreach ($values as $item) {
						if($temp  == "") $temp = $item;
						else $temp = $temp.",".$item;
					}

					$values = $temp;
					$temp   = "";
				}

				$sql = "UPDATE ".$table." SET ".$values.", changedBy = '".$_SESSION['tulisan_user_username']."', changedDate = NOW() WHERE idData = '".$id."'";

				$result = $this->db->query($sql);
				if($result){
					$feedStatus	= "success";
					$feedType   = "success";
					$feedMessage= "The process has been successful";
				}

				$feedType = $sql;
			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData);

			/* result fetch */
			$json = $resultList;

			return $json;

		}

		// CLONE DATA
		public function duplicateById($idData){
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Something went wrong, failed to duplicate data!";
			$feedDetail	= "failed";

			$temp		= "";

			/* open connection */
			$gate = $this->db;
			if($gate){

				//product
				$sql  = "CREATE TEMPORARY TABLE tmp SELECT CONCAT('Copy of ', `name`), `sku`, `description`, `material`, `dimension`, `price`, `storyId`, `categoryId`, `lookBook1`, `lookBook2`, `status`, '".$_SESSION['tulisan_user_username']."' as `createdBy`, NOW() as `createdDate` FROM products WHERE idData = '".$idData."';";
				$sql .= "INSERT INTO products (`name`, `sku`, `description`, `material`, `dimension`, `price`, `storyId`, `categoryId`, `lookBook1`, `lookBook2`, `status`, `createdBy`, `createdDate`) SELECT * FROM tmp t;";
				$sql .= "DROP TABLE tmp;";

				$result = $this->db->query($sql);
				if($result){

					closeGate();
					$this->db = openGate();
					$resultId = $this->fetchSingleRequest('products', array("idData"), "1=1 ORDER BY idData DESC LIMIT 1");
					$resultId = $resultId['feedData'];
					$resultId= $resultId['idData'];

					$feedStatus	= "success";
					$feedType   = "success";
					$feedMessage= "The process has been successful";

					//product variant
					$sql  = "CREATE TEMPORARY TABLE tmp SELECT '".$resultId."' as `productId`, `sku`, `artworkId`, `colorId`, `qty`, `price`, `size`, `dimension`, `frontPicture`, `backPicture`, `topPicture`, `rightPicture`, `bottomPicture`, `leftPicture`, '".$_SESSION['tulisan_user_username']."' as `createdBy`, NOW() as `createdDate` FROM products_variant WHERE productId = '".$idData."';";
					$sql .= "INSERT INTO products_variant (`productId`, `sku`, `artworkId`, `colorId`, `qty`, `price`, `size`, `dimension`, `frontPicture`, `backPicture`, `topPicture`, `rightPicture`, `bottomPicture`, `leftPicture`, `createdBy`, `createdDate`) SELECT * FROM tmp t;";
					$sql .= "DROP TABLE tmp;";

					$result = $this->db->query($sql);
					if($result){
						$feedStatus	= "success";
						$feedType   = "success";
						$feedMessage= "The process has been successful";
					}
				}

				$feedType = $sql;
			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedDetail" => $feedDetail);

			/* result fetch */
			$json = $resultList;

			return $json;
		}

		public function updateMultiData($table, $values, $ids){
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Something went wrong, failed to collect data!";
			$feedData	= array();
			$feedId		= "";

			$temp		= "";

			/* open connection */
			$gate = $this->db;
			if($gate){

				if(is_array($values)) {
					foreach ($values as $item) {
						if($temp  == "") $temp = $item;
						else $temp = $temp.",".$item;
					}

					$values = $temp;
					$temp   = "";
				}

				if(is_array($ids)) {
					foreach ($ids as $value) {
						if($temp  == "") $temp = $value;
						else $temp = $temp.",".$value;
					}

					$ids = $temp;
					$temp   = "";
				}

				$sql = "UPDATE ".$table." SET ".$values.", changedBy = '".$_SESSION['tulisan_user_username']."', changedDate = NOW() WHERE idData IN (".$ids.")";

				$result = $this->db->query($sql);
				if($result){
					$feedStatus	= "success";
					$feedType   = "success";
					$feedMessage= "The process has been successful";
				}

				$feedType = $sql;
			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData);

			/* result fetch */
			$json = $resultList;

			return $json;

		}

		//UPLOAD IMAGE
		public function uploadSingleImage($image, $dir, $table, $field, $id, $que = ""){
			error_reporting(E_ALL);
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Something went wrong, failed to upload data!";
			$feedData	= array();

			$temp		= "";

			/* open connection */
			$gate = $this->db;
			if($gate){

				/*upload image*/
				if(isset($image)){

					$file_name = $image['name'];
				    $file_size = $image['size'];
				    $file_tmp  = $image['tmp_name'];
				    $file_type = $image['type'];

					$Validextensions = array("jpeg", "JPEG", "jpg", "JPG", "png", "PNG", "gif", "GIF");
					$temporary 		 = explode(".", $file_name);
					$fileExtension   = end($temporary);
					$newFileName 	 = $dir."_".$id."_".$que.date("Ymdhisa").".".$fileExtension;
					$saveAs 		 = "../assets/".$dir."/".$newFileName;

					if (in_array($fileExtension, $Validextensions)) {
						if(move_uploaded_file($file_tmp, $saveAs)){
							$sql = "UPDATE ".$table." SET ".$field."='".$newFileName."' WHERE idData ='".$id."'";

							$result = $this->db->query($sql);
							if($result){
								$feedStatus	= "success";
								$feedType   = "success".is_dir($saveAs);
								$feedMessage= "The process has been successful";
							}
						}
					}
				}
				/*upload end*/

			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData);

			/* result fetch */
			$json = $resultList;

			return $json;

		}

		public function uploadMultiImage($image, $dir, $table, $field, $id){
			error_reporting(E_ALL);
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Something went wrong, failed to upload data!";
			$feedData	= array();

			$temp		= "";
			$counter	= 0;

			/* open connection */
			$gate = $this->db;
			if($gate){

				/*upload image*/
				if(isset($image)){

					foreach($image['tmp_name'] as $key => $tmp_name ){
						$counter++;
					    $file_name = $key.$image['name'][$key];
					    $file_size = $image['size'][$key];
					    $file_tmp  = $image['tmp_name'][$key];
					    $file_type = $image['type'][$key];

						$Validextensions = array("jpeg", "JPEG", "jpg", "JPG", "png", "PNG", "gif", "GIF");
						$temporary 		 = explode(".", $file_name);
						$fileExtension   = end($temporary);
						$newFileName 	 = $dir."_".$id."(".$counter.")".".".$fileExtension;
						$saveAs 		 = "../assets/".$dir."/".$newFileName;

						if (in_array($fileExtension, $Validextensions)) {
							if(move_uploaded_file($file_tmp, $saveAs)){
								$temp = ($temp == "") ? $newFileName : $temp.",".$newFileName;
							}

							if($temp != ""){
								$newFileName = $temp;

								$sql = "UPDATE ".$table." SET ".$field."='".$newFileName."' WHERE idData ='".$id."'";
								$result = $this->db->query($sql);
								if($result){
									$feedStatus	= "success";
									$feedType   = "success";
									$feedMessage= "The process has been successful";
								}
							}
						}

					}

				}
				/*upload end*/

			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData);

			/* result fetch */
			$json = $resultList;

			return $json;

		}

		public function uploadZoomImage($image, $dir, $table, $field, $id, $que){
			error_reporting(E_ALL);
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Something went wrong, failed to upload data!";
			$feedData	= array();

			$temp		= "";

			/* open connection */
			$gate = $this->db;
			if($gate){

				/*upload image*/
				if(isset($image)){

					$file_name = $image['name'];
				    $file_size = $image['size'];
				    $file_tmp  = $image['tmp_name'];
				    $file_type = $image['type'];

					$Validextensions = array("jpeg", "JPEG", "jpg", "JPG", "png", "PNG", "gif", "GIF");
					$temporary 		 = explode(".", $file_name);
					$fileExtension   = end($temporary);
					$newFileName 	 	 = $dir."_".$id."_".$que.".".$fileExtension;
					$saveAs 		 		 = "../assets/".$dir."/large/".$newFileName;

					if (in_array($fileExtension, $Validextensions)) {
						if(move_uploaded_file($file_tmp, $saveAs)){

							$this->imageThumb($saveAs, "../assets/products/small/".$newFileName, 340);
							$sql = "UPDATE ".$table." SET ".$field."='".$newFileName."' WHERE idData ='".$id."'";

							$result = $this->db->query($sql);
							if($result){
								$feedStatus	= "success";
								$feedType   = "success";
								$feedMessage= "The process has been successful";
							}
						}
					}
				}
				/*upload end*/

			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData);

			/* result fetch */
			$json = $resultList;

			return $json;

		}

		public function imageThumb($src,$dest,$desired_width = false, $desired_height = false){
		    /*If no dimenstion for thumbnail given, return false */
		    // if (!$desired_height&&!$desired_width) return false;
		    $fparts = pathinfo($src);

		    $ext = strtolower($fparts['extension']);
		    /* if its not an image return false */
		    if (!in_array($ext,array('gif','jpg','png','jpeg'))) return false;

		    /* read the source image */
		    if ($ext == 'gif')
		        $resource = imagecreatefromgif($src);
		    else if ($ext == 'png')
		        $resource = imagecreatefrompng($src);
		    else if ($ext == 'jpg' || $ext == 'jpeg')
		        $resource = imagecreatefromjpeg($src);

		    $width  = imagesx($resource);
		    $height = imagesy($resource);
		    /* find the "desired height" or "desired width" of this thumbnail, relative to each other, if one of them is not given  */
		    if(!$desired_height) $desired_height = floor($height*($desired_width/$width));
		    if(!$desired_width)  $desired_width  = floor($width*($desired_height/$height));

		    /* create a new, "virtual" image */
		    $virtual_image = imagecreatetruecolor($desired_width,$desired_height);

		    /* copy source image at a resized size */
		    imagecopyresized($virtual_image,$resource,0,0,0,0,$desired_width,$desired_height,$width,$height);

		    /* create the physical thumbnail image to its destination */
		    /* Use correct function based on the desired image type from $dest thumbnail source */
		    $fparts = pathinfo($dest);
		    $ext = strtolower($fparts['extension']);
		    /* if dest is not an image type, default to jpg */
		    if (!in_array($ext,array('gif','jpg','png','jpeg'))) $ext = 'jpg';
		    $dest = $fparts['dirname'].'/'.$fparts['filename'].'.'.$ext;

		    if ($ext == 'gif')
		        imagegif($virtual_image,$dest);
		    else if ($ext == 'png')
		        imagepng($virtual_image,$dest,1);
		    else if ($ext == 'jpg' || $ext == 'jpeg')
		        imagejpeg($virtual_image,$dest,100);

		    return true;
		}

		//IMAGE VIDEO
		public function uploadSingleVideo($image, $dir, $table, $field, $id){
			error_reporting(E_ALL);
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Something went wrong, failed to upload data!";
			$feedData	= array();

			$temp		= "";

			/* open connection */
			$gate = $this->db;
			if($gate){

				/*upload image*/
				if(isset($image)){

					$file_name = $image['name'];
				    $file_size = $image['size'];
				    $file_tmp  = $image['tmp_name'];
				    $file_type = $image['type'];

					$Validextensions = array("mp4", "MP4", "3gpp", "3GPP", "flv", "FLV");
					$temporary 		 = explode(".", $file_name);
					$fileExtension   = end($temporary);
					$newFileName 	 = $dir."_".$id.".".$fileExtension;
					$saveAs 		 = "../assets/".$dir."/".$newFileName;

					if (in_array($fileExtension, $Validextensions)) {
						if(move_uploaded_file($file_tmp, $saveAs)){
							$sql = "UPDATE ".$table." SET ".$field."='".$newFileName."', fileSize='".$file_size."' WHERE idData ='".$id."'";

							$result = $this->db->query($sql);
							if($result){
								$feedStatus	= "success";
								$feedType   = "success".is_dir($saveAs);
								$feedMessage= "The process has been successful";
							}
						}
					}
				}
				/*upload end*/

			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData);

			/* result fetch */
			$json = $resultList;

			return $json;

		}

		//UPLOAD FILE
		public function uploadFile($image, $dir, $table, $field, $id, $custom_name = ""){
			error_reporting(E_ALL);
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Something went wrong, failed to upload data!";
			$feedData	= array();

			$temp		= "";

			/* open connection */
			$gate = $this->db;
			if($gate){

				/*upload image*/
				if(isset($image)){

					$file_name = $image['name'];
			    $file_size = $image['size'];
			    $file_tmp  = $image['tmp_name'];
			    $file_type = $image['type'];

					$temporary 		 = explode(".", $file_name);
					$fileExtension = end($temporary);
					$newFileName 	 = (($custom_name != "") ? (str_replace(' ', '', $custom_name)).".".$fileExtension : "file_".$id.".".$fileExtension);
					$saveAs 		   = "../assets/".$dir."/".$newFileName;

					if(move_uploaded_file($file_tmp, $saveAs)){
						$sql = "UPDATE ".$table." SET ".$field."='".$newFileName."' WHERE idData ='".$id."'";
						$result = $this->db->query($sql);
						if($result){
							$feedStatus	= "success";
							$feedType   = "success".is_dir($saveAs);
							$feedMessage= "The process has been successful";
						}
					}
				}
				/*upload end*/

			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage." - ".$saveAs, "feedData" => $feedData);

			/* result fetch */
			$json = $resultList;

			return $json;

		}

	}

?>
