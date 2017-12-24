-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2017 at 05:15 PM
-- Server version: 5.6.21
-- PHP Version: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tulisan_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cms_blog`
--

CREATE TABLE IF NOT EXISTS `cms_blog` (
`idData` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `photoBy` varchar(100) NOT NULL,
  `pictures` text NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cms_blog`
--

INSERT INTO `cms_blog` (`idData`, `title`, `date`, `subtitle`, `description`, `photoBy`, `pictures`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(2, 'DOTTY OUTFIT', '25TH FEBRUARY 2014', 'LOCATION: NEW YORK', 'PHNwYW4gc3R5bGU9ImZvbnQtd2VpZ2h0OiBib2xkOyB0ZXh0LWFsaWduOiBqdXN0aWZ5OyI+QWx3YXlzIG9wdGluZyBmb3IgYSBiZWF1dGlmdWwgdHdvIHBpZWNlLCBvciBldmVuIGJldHRlciwgdGhyZWUgcGllY2UgZW5zZW1ibGUgaXMgc3VjaCBhbiBlYXN5IGFuZCBwb2xpc2hlZCB3YXkgb2YgZHJlc3NpbmcuIEluIHRoaXNjYXNlLCBJIGRlY2lkZWQgdG8gbGF5ZXIgZG90cyBvbiBkb3RzIG9uIGRvdHMgb24gbXkgbmV3IGZhdm91cml0ZSBkb3R0eSBiYWcuIEkgc3RpbGwgcmVtZW1iZXIgaG93IEkgZmVsdCB0aGUgZGF5IHdlIHNob3QgdGhlc2UgcGhvdG9zLlRoZSB0aW5pZXN0IHNsaXRoZXIgb2Ygc2lsdmVyIGxpZ2h0IGVzY2FwZWQgZnJvbSBiZXR3ZWVuIHRoZSBncmV5IHNoZWV0IG9mIGNsb3VkcyBhYm92ZSBhbmQgc3BpbGxlZCBvbnRvIHRoZSBjb25jcmV0ZSBwYXZlbWVudCBiZWxvdy5Gb3Igc29tZW9uZSB3aG8gaGFkbuKAmXQgc2VlbiBzdW4gaW4gdHdvIHdlZWtzIGl0IG1hZGUgZXZlcnl0aGluZyBpbGx1bWluYXRlIHdpdGggYSBzb2Z0IHNpbHZlciBnbG93IHRlbiB0aW1lcyBtb3JlIHRoYW4gdXN1YWwuIEl0d2FzIG5pY2UgdG8gZmluYWxseSB3aXRuZXNzIE5ldyBZb3JrIGluIHRoZSBzaGltbWVyaW5nIGxpZ2h0IEkgaGFkIGJlZW4gdmlzdWFsaXNpbmcgaXQgaW4gZXZlciBzaW5jZSBJIGxlZnQgYmFjayBpbiBTZXB0ZW1iZXIsIHBlcmNoZWRoaWdoIG9uIGl0cyBzbWl0dGVuIHBlZGVzdGFsIGFjY29tcGFuaWVkIGJ5IGJpZ2dlciBhbmQgYmV0dGVyIGV4cGVjdGF0aW9ucy4gTHVja2lseSwgTmV3IFlvcmsgYWx3YXlzIGRlbGl2ZXJzPC9zcGFuPjxicj4=', 'Carin Olsson', 'blogs_2(1).jpg,blogs_2(2).jpg,blogs_2(3).jpg', 'SESSION_TEST', '2017-10-23 17:05:25', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_chatter`
--

CREATE TABLE IF NOT EXISTS `cms_chatter` (
`idData` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `date` varchar(100) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cms_home`
--

CREATE TABLE IF NOT EXISTS `cms_home` (
`idData` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cms_home`
--

INSERT INTO `cms_home` (`idData`, `title`, `description`, `picture`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(4, 'EMPROWERING OTHERS', 'We are dedicated to enriching our community by investing our time in training and employing local artisansand talents with an aim to provide them a fair living with benefits that exceed market standards.', 'home_4.jpg', 'SESSION_TEST', '2017-10-23 15:17:10', 'SESSION_TEST', '2017-10-23 15:20:51'),
(5, 'CELEBRATING INDIVIDUALITY', 'We design our products to be simple and pure, then layer them with artist-illustrated editions to celebrate individuality. Each creation is constructed by hand in small batches, with artisanal craftsmanship.', 'home_5.jpg', 'SESSION_TEST', '2017-10-23 15:17:58', NULL, NULL),
(6, 'CARING FOR OUR WORLD', 'We strive to improve the quality of our work by being responsive of our surroundings and by using sustainable design principles to foster a healthier environment.', 'home_6.jpg', 'SESSION_TEST', '2017-10-23 15:18:36', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_story`
--

CREATE TABLE IF NOT EXISTS `cms_story` (
`idData` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `author` varchar(100) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cms_story`
--

INSERT INTO `cms_story` (`idData`, `title`, `subtitle`, `description`, `author`, `picture`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(3, 'PEPE AND THE FLYING BALLOON', 'The little girl gave Pepe a big hug and said "I have been endlessly chasing the horizon running away from monsters that keep haunting me "', 'PHNwYW4gc3R5bGU9InRleHQtYWxpZ246IGp1c3RpZnk7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTAsIDI0NiwgMjM3KTsiPk9uY2UgdXBvbiBhIHRpbWUsIHRoZXJlIHdlcmUgdHdvIG1pY2UgdGhhdCBsaXZlZCBhbiBhZHZlbnR1cm91cyBsaWZlIGluIHRoZSBoZWFydCBvZiBKYWthcnRhLiBIaXJvIGFuZCBoaXMgd2lmZSwgU3VyLCB3ZXJlIGEgaGFyZC13b3JraW5nIGFuZCBjb3VyYWdlb3VzIGR1by4gRXZlbiB0aG91Z2ggdGhleSB3ZXJlIHRpbnkgY3JlYXR1cmVzLCB0aGVpciBoZWFydHMgd2VyZSBzZXQgb24gcmVzY3VpbmcgYWJhbmRvbmVkIGNoaWxkcmVuIHdobyBsaXZlZCBvbiB0aGUgc3RyZWV0cy4gU29tZXRpbWVzIHRoZXkgc2xlcHQgdW5kZXIgdGhlIHJvb2Z0b3BzIG9mIGJpZyBob3VzZXMsIHdoZXJlIHRoZXkgY291bGQgc3RlYWwgc29tZSBmb29kIGZvciB0aGVzZSBjaGlsZHJlbi4gT3RoZXIgdGltZXMgdGhleSBzcGVudCB0aGUgbmlnaHQgaW4gYSBjbG90aGluZyBmYWN0b3J5LCB3aGVyZSBTdXIgd291bGQgc2V3IGxpdHRsZSBzY2FydmVzIGZyb20gbGVmdG92ZXIgbWF0ZXJpYWxzLiBCdXQgdGhleSBzcGVudCBtb3N0IG9mIHRoZWlyIHRpbWUgdW5kZXIgYSBicmlkZ2UgYXQgdGhlIHZpbnRhZ2UgdHJhaW4gc3RhdGlvbiBpbiBLb3RhIC0gdGhlIG9sZCB0b3duIC0gd2hlcmUgYWJvdXQgdHdlbnR5IHRvIHRoaXJ0eSBuZWdsZWN0ZWQga2lkcyBzb3VnaHQgc2hlbHRlciBlYWNoIG5pZ2h0LiBUaGUgb2xkIGJyaWRnZSBoYWQgYSBuYXN0eSBhbmQgZGFtcCBhdG1vc3BoZXJlLCBidXQgaXQgd2FzIGhlcmUgdGhhdCBIaXJvIGFuZCBTdXIgZmVsdCB0aGV5IHdlcmUgbmVlZGVkIG1vc3QuIEFzIHRoZSBjaGlsZHJlbiBzbGVwdCwgSGlybyB3b3VsZCBjYXJlZnVsbHkgd3JhcCB0aGVpciBuZWNrcyB3aXRoIHRoZSBzY2FydmVzIHRoYXQgU3VyIG1hZGUgYW5kIGdlbnRseSBwbGFjZSBmb29kIG5leHQgdG8gdGhlbS4gTm9uZSBvZiB0aGUga2lkcyBldmVyIGZvdW5kIG91dCB3aG8gdGhlaXIgc2VjcmV0IGd1YXJkaWFucyB0cnVseSB3ZXJlLiZuYnNwOzwvc3Bhbj48YnIgc3R5bGU9InRleHQtYWxpZ246IGp1c3RpZnk7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTAsIDI0NiwgMjM3KTsiPjxiciBzdHlsZT0idGV4dC1hbGlnbjoganVzdGlmeTsgYmFja2dyb3VuZC1jb2xvcjogcmdiKDI1MCwgMjQ2LCAyMzcpOyI+PHNwYW4gc3R5bGU9InRleHQtYWxpZ246IGp1c3RpZnk7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTAsIDI0NiwgMjM3KTsiPk1hbnkgbmFtZWxlc3MgY2hpbGRyZW4gd2l0aCBteXN0ZXJpb3VzIHN0b3JpZXMgY2FtZSB0byB0aGlzIGRhcmsgY29ybmVyLiBBZnRlciBhIHdoaWxlLCBzb21lIHdvdWxkIGxlYXZlIHRvIHNlZWsgc2hlbHRlciBlbHNld2hlcmUsIHdoaWxlIG90aGVycyBzdWZmZXJlZCB0cmFnaWMgZW5kcy4gT25lIGRheSwgYSBjaGlsZCB3aXRoIGEgc2hhdmVkIGhlYWQgbGltcGVkIGludG8gdGhpcyBwbGFjZS4gVGhlIGNoaWxk4oCZcyBkYXJrLCB0aGluLCBhbmQgZmxhdCBjaGVzdCBzdWdnZXN0ZWQgdGhhdCBpdCB3YXMgYSBib3kuIFlldCwgc3RhcnJpbmcgZGVlcGx5IGludG8gdGhlIHlvdW5nIHZpc2l0b3LigJlzIGxhcmdlIGFsbW9uZCBleWVzLCBTdXIga25ldyB0aGlzIHBvb3Igc291bCB3YXMgYSBsaXR0bGUgZ2lybC4gSGVyIGV4cHJlc3Npb24gY29udmV5ZWQgYSBtaXggb2YgcmFnZSwgZmVhciwgbG9uZ2luZywgYW5kIHNvcnJvdzsgYnV0IGhlciBleWVzIGhlbGQgdGhlIGJ1cm5pbmcgZmxhbWUgb2YgU3Jpa2FuZGkncyAodGhlIGFuY2llbnQgSmF2YW5lc2Ugd2FycmlvciBnb2RkZXNzKSBzcGlyaXQuIEFjdGluZyBsaWtlIGFuIGFuZ3J5IGJveSB3YXMgaGVyIG1lYW5zIG9mIHN1cnZpdmluZyB0aGUgYWJ1c2UgYW5kIHZpb2xlbmNlIG9mIHRoZSBzdHJlZXRzLiBOb3cgaXQgc2VlbWVkIGFzIGlmIHNoZSBoYWQgYmVlbiBydW5uaW5nIGZvciBob3VycyBmcm9tIHNvbWV0aGluZy4gSGVyIGxpcHMgd2VyZSBwYWxlIGFuZCBjb2xkLiBIZXIgYm9keSB3YXMgc2hha2luZyBmcm9tIGV4aGF1c3Rpb24uIFNoZSBrbmVsdCB0byB0aGUgZ3JvdW5kIGFuZCBmZWxsIGludG8gYSBkZWVwIHNsZWVwIGluc2lkZSBhIHRvcm4gcGFja2luZyBib3ggdGhhdCBIaXJvIGhhZCBwcm9jdXJlZCBmcm9tIHRoZSBmYWN0b3J5LiBFdmVuIGFzIHRoZSBsaXR0bGUgZ2lybCBzbGVwdCwgdGhlcmUgd2FzIGludGVuc2l0eSBvbiBoZXIgZmFjZSwgYW5kIFN1ciBmZWxsIGluIGxvdmUgd2l0aCB0aGUgZ2lybCdzIGZpZ2h0aW5nIHNwaXJpdC4mbmJzcDs8L3NwYW4+PGJyIHN0eWxlPSJ0ZXh0LWFsaWduOiBqdXN0aWZ5OyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjUwLCAyNDYsIDIzNyk7Ij48YnIgc3R5bGU9InRleHQtYWxpZ246IGp1c3RpZnk7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTAsIDI0NiwgMjM3KTsiPjxzcGFuIHN0eWxlPSJ0ZXh0LWFsaWduOiBqdXN0aWZ5OyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjUwLCAyNDYsIDIzNyk7Ij5TdXIgc2F0IGRvd24gbmV4dCB0byBoZXIgYW5kIHN0YXJ0ZWQgdG8gc2V3IGEgdGlueSBkb2xsIHdoaWxlIGh1bW1pbmcgYW4gZW5jaGFudGluZyBsdWxsYWJ5LiBUaGlzIGxvdmluZyBtb3VzZSBoYWQgYSBtaXJhY3Vsb3VzIHBvd2VyIHdoZW4gc2hlIHNld2VkLiBFdmVyeSBzdGl0Y2ggc2hlIG1hZGUgd2FzIHBlcmZvcm1lZCB3aXRoIGEgc29sZW1uIHdpc2ggZm9yIHRoZSBjaGlsZC4gQXMgc2hlIGNvbXBsZXRlZCB0aGUgZG9sbCwgYSBzdGFyIHNob3QgYWNyb3NzIHRoZSBkZWVwIGJsdWUgc2t5IGFib3ZlIHRoZW0uIEl0IGJyb2tlIGludG8gdGlueSBmaXJlZmxpZXMgd2hpY2ggZW52ZWxvcGVkIHRoZSB3aXNoZnVsIGRvbGwgaW4gYSB3YXJtIGdsb3cgYW5kIGJsZXNzZWQgaXQgd2l0aCBhIHNtaWxlLiBTdXIgbmFtZWQgdGhpcyBkb2xsIOKAnFBlcGXigJ0gYWZ0ZXIgdGhlIGxhYmVsIHByaW50ZWQgb24gdGhlIGJveCB3aGVyZSB0aGUgbGl0dGxlIGdpcmwgc2xlcHQuIFdoZW4gc2hlIGdpbmdlcmx5IHBsYWNlZCB0aGUgZG9sbCBpbiB0aGUgY2hpbGQncyBlbWJyYWNlLCBhbiBhaXIgb2Ygam95IGZpbGxlZCB0aGUgZ2lybCdzIGZhY2UsIGFzIGlmIHNoZSBoYWQganVzdCBlbnRlcmVkIGEgbWFnbmlmaWNlbnQgZHJlYW0uIFRoZSBjbHVzdGVyIG9mIGZpcmVmbGllcyB0d2lua2xlZCBhYm92ZSB0aGlzIGdpcmwgYW5kIGxpdCBhbiBpbWFnZSBvZiB3aGF0IHNlZW1lZCB0byBiZSBoZXIgZHJlYW0uJm5ic3A7PC9zcGFuPjxiciBzdHlsZT0idGV4dC1hbGlnbjoganVzdGlmeTsgYmFja2dyb3VuZC1jb2xvcjogcmdiKDI1MCwgMjQ2LCAyMzcpOyI+PHNwYW4gc3R5bGU9InRleHQtYWxpZ246IGp1c3RpZnk7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTAsIDI0NiwgMjM3KTsiPkluIGhlciBkcmVhbSwgdGhpcyBsaXR0bGUgZ2lybCBmb3VuZCBoZXJzZWxmIHJ1bm5pbmcgdGhyb3VnaCBhIG15c3RpY2FsIGZvcmVzdC4gU2hlIHdhcyB3ZWFyaW5nIGEgbG9uZyBjb3R0b24gZHJlc3Mgd2l0aCBodWdlIEJvdWdhaW52aWxsZWEgZmxvd2VycyBwYWludGVkIG9uIGl0LiBUaGVyZSwgc2hlIG1ldCBQZXBlIC0gYSBzcGFya2xpbmcgYW5kIHdpdHR5IGRvbGwgd2l0aCBhIHdhcm0gaHVtYW4gaGVhcnQuIFBlcGUgbG92ZWQgamF6eiBhbmQgcGxheWVkIGhpcyB0cnVtcGV0IGxpa2UgYW55IG90aGVyIGNyYXp5IG11c2ljaWFuLiBUaGUgbXVzaWMgaGUgcGxheWVkIGNhc3QgYSBzcGVsbCB0aGF0IGNvdWxkIHR1cm4gc29tZSBkcmVhbXMgaW50byByZWFsaXR5LiBIZSBsaXN0ZW5lZCB0byBoZXIgc3RvcmllcyBhbmQgbWFkZSBoZXIgbGF1Z2g7IHNvbWV0aGluZyB0aGF0IHNoZSBoYWQgbm90IGRvbmUgZm9yIGEgbG9uZyB0aW1lLiZuYnNwOzwvc3Bhbj48YnIgc3R5bGU9InRleHQtYWxpZ246IGp1c3RpZnk7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTAsIDI0NiwgMjM3KTsiPjxiciBzdHlsZT0idGV4dC1hbGlnbjoganVzdGlmeTsgYmFja2dyb3VuZC1jb2xvcjogcmdiKDI1MCwgMjQ2LCAyMzcpOyI+PHNwYW4gc3R5bGU9InRleHQtYWxpZ246IGp1c3RpZnk7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTAsIDI0NiwgMjM3KTsiPlRoZSBsaXR0bGUgZ2lybCBnYXZlIFBlcGUgYSBiaWcgaHVnIGFuZCBzYWlkLCDigJxJIGhhdmUgYmVlbiBlbmRsZXNzbHkgY2hhc2luZyB0aGUgaG9yaXpvbiwgcnVubmluZyBhd2F5IGZyb20gbW9uc3RlcnMgdGhhdCBrZWVwIGhhdW50aW5nIG1lLiBEZXN0aW55IGhhcyBicm91Z2h0IG1lIHRvIHlvdSwgc28gdGhhdCBmb3IgYSBmZXcgbWludXRlcyBvZiBteSBsaWZlIEkgY291bGQgZXhwZXJpZW5jZSB3YXJtdGggYW5kIHRlbmRlcm5lc3MuIFBsZWFzZSB0YWtlIG1lIGF3YXkgZnJvbSB0aGlzIGRhcmsgcGxhY2Ugc28gSSBjYW4gc3RvcCBydW5uaW5nLiBJIHdpc2ggdG8gZmx5IGFuZCBiZSBpbiBhIHdvcmxkIHdoZXJlIEkgY2FuIHN0b3AgcHJldGVuZGluZyB0byBiZSBzb21ldGhpbmcgSeKAmW0gbm90IGFuZCBjYW4gYmUgbXkgdHJ1ZSBzZWxmLiZuYnNwOzwvc3Bhbj48YnIgc3R5bGU9InRleHQtYWxpZ246IGp1c3RpZnk7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTAsIDI0NiwgMjM3KTsiPjxiciBzdHlsZT0idGV4dC1hbGlnbjoganVzdGlmeTsgYmFja2dyb3VuZC1jb2xvcjogcmdiKDI1MCwgMjQ2LCAyMzcpOyI+PHNwYW4gc3R5bGU9InRleHQtYWxpZ246IGp1c3RpZnk7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTAsIDI0NiwgMjM3KTsiPlBlcGUgaGVsZCBoZXIgaGFuZCBhbmQgbG9va2VkIGludG8gaGVyIHRlYXJ5IGV5ZXMuIEFzIGhlIHdoaXN0bGVkIGEgbWVsYW5jaG9saWMgbWVsb2R5LCBhIHN0cmlwZWQgYmFsbG9vbiBtYWdpY2FsbHkgYXBwZWFyZWQuIFNoZSBjbGltYmVkIHVwIGFuZCBzYXQgb24gdG9wIG9mIGl0IGFzIGl0IHNsb3dseSByb3NlIHRvIHRoZSBza3kuIFdpdGggYSBzbWFsbCBraXRlIHRvIG5hdmlnYXRlIHRoZSBiYWxsb29uLCB0aGV5IGZvbGxvd2VkIHRoZSB3aW5kIHdoaWNoIGNhcnJpZWQgdGhlbSBmcm9tIHRoZSBkYXJrIGZvcmVzdCwgb3ZlciB0aGUgbW91bnRhaW5zLCBhYm92ZSB0aGUgY2l0aWVz4oCZIHNreXNjcmFwZXJzLCBhbmQgdGhyb3VnaCB0aGUgY2xvdWRzLiBGcm9tIHVwIGFib3ZlLCBzaGUgc2F3IHBlb3BsZSBsaXZpbmcgZGlmZmVyZW50IGxpdmVzLiBTb21lIGVuam95ZWQgbW9yZSBmb3J0dW5hdGUgbW9tZW50cywgd2hpbGUgb3RoZXJzIGhhZCB0byBmYWNlIGEgbW9yZSBjaGFsbGVuZ2luZyBmYXRlIHRoYW4gaGVycy4gU2hlIGZvdW5kIHRoYXQgc2hlIGNvdWxkIHBhaW50IGhlciBsaWZlIHdpdGggYW55IGNvbG9ycyBzaGUgd2lzaGVkIGFuZCBkcmF3IGhlciBvd24gaG9yaXpvbnMgd2l0aG91dCBoYXZpbmcgdG8gcmVhY2ggb3V0IGZvciB0aGVtLiBTb3Jyb3cgYW5kIG1vbnN0ZXJzIGV4aXN0ZWQgb25seSBpbiBoZXIgbWluZCwgbm90IGluIGhlciByZWFsaXR5LiBJdCBhbGwgZGVwZW5kZWQgb24gaG93IHNoZSBsb29rZWQgYXQgdGhlbS4gQW5kIG5vdyB3aXRoIHRoaXMgbmV3IHBlcnNwZWN0aXZlLCBzaGUgZmVsdCBiZXR0ZXIuJm5ic3A7PC9zcGFuPjxiciBzdHlsZT0idGV4dC1hbGlnbjoganVzdGlmeTsgYmFja2dyb3VuZC1jb2xvcjogcmdiKDI1MCwgMjQ2LCAyMzcpOyI+PGJyIHN0eWxlPSJ0ZXh0LWFsaWduOiBqdXN0aWZ5OyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjUwLCAyNDYsIDIzNyk7Ij48c3BhbiBzdHlsZT0idGV4dC1hbGlnbjoganVzdGlmeTsgYmFja2dyb3VuZC1jb2xvcjogcmdiKDI1MCwgMjQ2LCAyMzcpOyI+U2hlIHdhcyBvbiB0aGUgdG9wIG9mIGhlciB1bml2ZXJzZSB3aGVuIFBlcGUgZ2F2ZSBoZXIgYSBzdWRkZW4ga2lzcyBvbiB0aGUgY2hlZWssIGZsZXcgYXdheSwgYW5kIGRpc2FwcGVhcmVkIGJlaGluZCB0aGUgbW9vbi4gSGVyIGZ1bm55IHZhbGVudGluZSB3YXMgbm93aGVyZSB0byBiZSBzZWVuLiBUaGUgYmFsbG9vbiBkcmlmdGVkIGRvd24gYXQgYSBzcGVlZCBzaGUgY291bGQgbm90IGNvbnRyb2wsIGhlciBicmVhdGggYmVjYW1lIHRoaW4sIGFuZCB0aGUgd29ybGQgd2FzIGFnYWluIGEgZmVhcmZ1bCBwbGFjZS4gU2hlIHN1bW1vbmVkIHRoZSByZW1haW5pbmcgY291cmFnZSB0aGF0IHNoZSBoYWQsIHRvb2sgYSBkZWVwIGJyZWF0aCwgYW5kIHNsaWQgYXdheSBmcm9tIHRoZSB0b3Agb2YgdGhlIGJhbGxvb24uIEhlciB3aGl0ZSBjb3R0b24gZHJlc3Mgc2VydmVkIGFzIGEgcGFyYWNodXRlIHN1Y2ggdGhhdCBzaGUgY291bGQgbGFuZCBncmFjZWZ1bGx5LiBBcyBzaGUgdG91Y2hlZCB0aGUgZ3JvdW5kLCB0aGUgbGl0dGxlIGdpcmwgd29rZSB1cCBhbmQgZm91bmQgaGVyc2VsZiB3aXRoIHRoZSBsaXR0bGUgUGVwZSBkb2xsIG5lc3RsZWQgaW4gaGVyIGVtYnJhY2UuPC9zcGFuPjxicj4=', 'Melisa Sanjaya', 'stories_3.png', 'SESSION_TEST', '2017-10-23 16:10:18', 'SESSION_TEST', '2017-10-23 16:20:13');

-- --------------------------------------------------------

--
-- Table structure for table `cms_video`
--

CREATE TABLE IF NOT EXISTS `cms_video` (
`idData` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `fileName` varchar(100) NOT NULL,
  `fileSize` varchar(10) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cms_video`
--

INSERT INTO `cms_video` (`idData`, `title`, `description`, `fileName`, `fileSize`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(4, 'Finding Unconditional Love', 'PHNwYW4gc3R5bGU9InRleHQtYWxpZ246IGp1c3RpZnk7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTAsIDI0NiwgMjM3KTsiPlRoZSBTb3VuZCBvZiBEYXdu4oCZLCBhbiBhcnQgcHJvamVjdCBieSBtdWx0aS1kaW1lbnNpb25hbCBhcnRpc3QgTWVsaXNzYSBTdW5qYXlhLCBleGFtaW5lcyB0aGUgY29uY2VwdCBvZiBzZWxmLWxvdmUuIFRoaXMgc2Vuc3VhbCBwcm9zZSBpcyBhYm91dCBhIHNwaXJpdHVhbCBhd2FrZW5pbmcgdG8gZGlzY292ZXIgYmxpc3MgYW5kIGhhcHBpbmVzcyB3aXRoaW4gb3Vyc2VsdmVzLiBPbmx5IHRocm91Z2ggYSBjb21taXRtZW50IG9mIGxvdmluZyBvdXJzZWx2ZXMgd2hvbGVoZWFydGVkbHksIHdlIGNhbiBiZWdpbiB0byBsb3ZlIG90aGVycyB1bmNvbmRpdGlvbmFsbHkuPC9zcGFuPjxiciBzdHlsZT0idGV4dC1hbGlnbjoganVzdGlmeTsgYmFja2dyb3VuZC1jb2xvcjogcmdiKDI1MCwgMjQ2LCAyMzcpOyI+PHNwYW4gc3R5bGU9InRleHQtYWxpZ246IGp1c3RpZnk7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTAsIDI0NiwgMjM3KTsiPldlIHJlY2VudGx5IHNhdCBkb3duIHdpdGggZGVzaWduZXIgWmhpanVuIFdhbmcgdG8gZGlzY3VzcyBoaXMgcHJvamVjdCB0aGF0IHR1cm5zIGh5cGVkIHNuZWFrZXJzIGludG8gd2VhcmFibGUgZmFjZSBtYXNrcy4gVGhlIEJlaWppbmctYmFzZWQgY3JlYXRpdmUgc3RhcnRlZCBoaXMgZmFjZSBtYXNrIHByb2plY3QgdG8gY29tbWVudCBvbiB0aGUgcG9sbHV0aW9uIGluIGhpcyBjaXR5LCB3aGVyZSBjaXRpemVucyBhcmUgYmF0dGxpbmcgZXh0cmVtZSBhaXIgcG9sbHV0aW9uLiBVbmRlcnN0YW5kYWJseSwgV2FuZ+KAmXMgbWFzayBwcm9qZWN0cyBoYXZlIGJlZW4gbWV0IHdpdGggbWl4ZWQgcmVzcG9uc2VzIGFuZCBoYXZlIGNyZWF0ZWQgcXVpdGUgYSBidXp6IG9uIHRoZSBpbnRlcm5ldC4gSW4gb3VyIHRhbGsgd2l0aCBXYW5nIGhlIG5vdGVzIHRoYXQgaGUgb25seSB3aXNoZXMgdG8gbWFrZSBpbnRlcmVzdGluZyBpdGVtcyB0aGF0IG5vIG9uZSBoYXMgbWFkZSBiZWZvcmUgYW5kIHRoYXQgaGUgaGFzIG5vIGludGVyZXN0IGluIHNlbGxpbmcgaGlzIG1hc2tzLiBBZGRpdGlvbmFsbHksIHdlIGdhdmUgYSBwYWlyIG9mIG91ciBIWVBFQkVBU1QgMjB0aCBhbm5pdmVyc2FyeSBOZXcgQmFsYW5jZSA1ODAg4oCcRWFydGjigJ0gc25lYWtlcnMgdG8gV2FuZyB0byBiZSBtYWRlIGludG8gb25lIG9mIGhpcyBzaWduYXR1cmUgZmFjZSBtYXNrcy48L3NwYW4+', 'videos_4.mp4', '10221416', 'SESSION_TEST', '2017-10-23 18:33:00', 'SESSION_TEST', '2017-10-23 18:41:47');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE IF NOT EXISTS `colors` (
`idData` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`idData`, `name`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(3, 'Blue Arch', 'SESSION_TEST', '2017-10-23 14:39:48', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
`idData` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `zipCode` varchar(10) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `email` varchar(100) NOT NULL,
  `userId` int(11) NOT NULL,
  `company` varchar(100) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`idData`, `name`, `address`, `city`, `country`, `zipCode`, `phone`, `email`, `userId`, `company`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(1, 'Nara sikakait', 'Bojong bata', 'pemalang', 'Indonesia', '52313', '0857', 'megan@gmail.com', 4, 'sync', 'SESSION_TEST', '2017-10-23 21:32:06', 'SESSION_TEST', '2017-10-23 21:40:24');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE IF NOT EXISTS `departments` (
`idData` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`idData`, `name`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(4, 'Product', 'SESSION_TEST', '2017-10-23 14:50:26', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
`idData` int(11) NOT NULL,
  `orderId` varchar(20) NOT NULL,
  `customerId` int(11) NOT NULL,
  `productsId` text NOT NULL,
  `quanties` text NOT NULL,
  `total` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
`idData` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `sku` varchar(10) NOT NULL,
  `description` text NOT NULL,
  `material` text NOT NULL,
  `dimension` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` varchar(15) NOT NULL,
  `storyId` int(11) NOT NULL,
  `colorId` int(11) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `pattern` text NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` int(11) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`idData`, `name`, `sku`, `description`, `material`, `dimension`, `qty`, `price`, `storyId`, `colorId`, `picture`, `pattern`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(21, 'Altier Box', 'ALTBX', 'Much like the Gallery Tote, the Atelier Box has a structure that lends to organization. This attachÃ© is perfect for an afternoon stroll about town or to keep at home to tidy files and accessories. The Atelier features a short handle to clutch or sling over one elbow as a sophisticated shopper. An interior split stitched pocket helps secure smaller items like a cellphone or business cards.', 'Water-resistant, non-toxic coated cotton canvas and coated polyester lining. Comes with dust bag.', '13 x 7.5 x 12 in', 15, '7,700,000', 3, 3, 'products_21.jpg', 'patterns_21(1).jpg,patterns_21(2).jpg,patterns_21(3).jpg,patterns_21(4).jpg', 'SESSION_TEST', '2017-10-23 20:31:01', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`idData` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `departmentId` int(11) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`idData`, `name`, `username`, `password`, `type`, `departmentId`, `picture`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(0, 'Administrator', 'admin@tulisan.com', '21232f297a57a5a743894a0e4a801fc3', 'admin', 0, 'users_1.gif', 'SESSION_TEST', '2017-10-23 19:57:19', 'SESSION_TEST', '2017-10-23 20:10:30'),
(3, 'megan', 'megan@syncard.com', 'd41d8cd98f00b204e9800998ecf8427e', 'admin', 4, 'users_3.jpg', 'SESSION_TEST', '2017-10-23 20:13:56', 'SESSION_TEST', '2017-10-23 20:22:18'),
(4, 'Nara nara', 'megan@gmail.com', '202cb962ac59075b964b07152d234b70', 'Customer', 0, 'users_4.jpg', 'SESSION_TEST', '2017-10-23 21:32:06', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE IF NOT EXISTS `vendors` (
`idData` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(5) NOT NULL,
  `zipCode` varchar(10) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `email` varchar(100) NOT NULL,
  `company` varchar(100) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`idData`, `name`, `address`, `city`, `country`, `zipCode`, `phone`, `email`, `company`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(3, 'Vendor 1', 'Jalan... ', 'Bandung', 'Indon', 'xxxxx', '123', 'email@co.com', 'No Company', 'SESSION_TEST', '2017-10-23 22:10:27', 'SESSION_TEST', '2017-10-23 22:13:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cms_blog`
--
ALTER TABLE `cms_blog`
 ADD PRIMARY KEY (`idData`);

--
-- Indexes for table `cms_chatter`
--
ALTER TABLE `cms_chatter`
 ADD PRIMARY KEY (`idData`);

--
-- Indexes for table `cms_home`
--
ALTER TABLE `cms_home`
 ADD PRIMARY KEY (`idData`);

--
-- Indexes for table `cms_story`
--
ALTER TABLE `cms_story`
 ADD PRIMARY KEY (`idData`);

--
-- Indexes for table `cms_video`
--
ALTER TABLE `cms_video`
 ADD PRIMARY KEY (`idData`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
 ADD PRIMARY KEY (`idData`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
 ADD PRIMARY KEY (`idData`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
 ADD PRIMARY KEY (`idData`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
 ADD PRIMARY KEY (`idData`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
 ADD PRIMARY KEY (`idData`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`idData`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
 ADD PRIMARY KEY (`idData`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cms_blog`
--
ALTER TABLE `cms_blog`
MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cms_chatter`
--
ALTER TABLE `cms_chatter`
MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cms_home`
--
ALTER TABLE `cms_home`
MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `cms_story`
--
ALTER TABLE `cms_story`
MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `cms_video`
--
ALTER TABLE `cms_video`
MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
