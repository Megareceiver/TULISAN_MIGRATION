-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 26 Des 2017 pada 20.46
-- Versi server: 5.5.42
-- Versi PHP: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tulisan_migration_3`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cancelation`
--

CREATE TABLE `cancelation` (
  `idData` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `reason` text NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `idData` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_blog`
--

CREATE TABLE `cms_blog` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `cms_blog`
--

INSERT INTO `cms_blog` (`idData`, `title`, `date`, `subtitle`, `description`, `photoBy`, `pictures`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(2, 'DOTTY OUTFIT', '25TH FEBRUARY 2014', 'LOCATION: NEW YORK', 'PHNwYW4gc3R5bGU9ImZvbnQtd2VpZ2h0OiBib2xkOyB0ZXh0LWFsaWduOiBqdXN0aWZ5OyI+QWx3YXlzIG9wdGluZyBmb3IgYSBiZWF1dGlmdWwgdHdvIHBpZWNlLCBvciBldmVuIGJldHRlciwgdGhyZWUgcGllY2UgZW5zZW1ibGUgaXMgc3VjaCBhbiBlYXN5IGFuZCBwb2xpc2hlZCB3YXkgb2YgZHJlc3NpbmcuIEluIHRoaXNjYXNlLCBJIGRlY2lkZWQgdG8gbGF5ZXIgZG90cyBvbiBkb3RzIG9uIGRvdHMgb24gbXkgbmV3IGZhdm91cml0ZSBkb3R0eSBiYWcuIEkgc3RpbGwgcmVtZW1iZXIgaG93IEkgZmVsdCB0aGUgZGF5IHdlIHNob3QgdGhlc2UgcGhvdG9zLlRoZSB0aW5pZXN0IHNsaXRoZXIgb2Ygc2lsdmVyIGxpZ2h0IGVzY2FwZWQgZnJvbSBiZXR3ZWVuIHRoZSBncmV5IHNoZWV0IG9mIGNsb3VkcyBhYm92ZSBhbmQgc3BpbGxlZCBvbnRvIHRoZSBjb25jcmV0ZSBwYXZlbWVudCBiZWxvdy5Gb3Igc29tZW9uZSB3aG8gaGFkbuKAmXQgc2VlbiBzdW4gaW4gdHdvIHdlZWtzIGl0IG1hZGUgZXZlcnl0aGluZyBpbGx1bWluYXRlIHdpdGggYSBzb2Z0IHNpbHZlciBnbG93IHRlbiB0aW1lcyBtb3JlIHRoYW4gdXN1YWwuIEl0d2FzIG5pY2UgdG8gZmluYWxseSB3aXRuZXNzIE5ldyBZb3JrIGluIHRoZSBzaGltbWVyaW5nIGxpZ2h0IEkgaGFkIGJlZW4gdmlzdWFsaXNpbmcgaXQgaW4gZXZlciBzaW5jZSBJIGxlZnQgYmFjayBpbiBTZXB0ZW1iZXIsIHBlcmNoZWRoaWdoIG9uIGl0cyBzbWl0dGVuIHBlZGVzdGFsIGFjY29tcGFuaWVkIGJ5IGJpZ2dlciBhbmQgYmV0dGVyIGV4cGVjdGF0aW9ucy4gTHVja2lseSwgTmV3IFlvcmsgYWx3YXlzIGRlbGl2ZXJzPC9zcGFuPjxicj4=', 'Carin Olsson', 'blogs_2(1).jpg,blogs_2(2).jpg,blogs_2(3).jpg', 'SESSION_TEST', '2017-10-23 17:05:25', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_chatter`
--

CREATE TABLE `cms_chatter` (
  `idData` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `date` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `cms_chatter`
--

INSERT INTO `cms_chatter` (`idData`, `title`, `description`, `date`, `type`, `picture`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(1, 'In Style', '', 'December 2011', '', 'chatters_1_20171203064916pm.jpg', 'megan@syncard.com', '2017-12-04 00:49:16', NULL, NULL),
(2, 'Nylon', '', 'Februery 2012', '', 'chatters_2_20171203065009pm.jpg', 'megan@syncard.com', '2017-12-04 00:50:09', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_home`
--

CREATE TABLE `cms_home` (
  `idData` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `cms_home`
--

INSERT INTO `cms_home` (`idData`, `title`, `description`, `picture`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(4, 'EMPROWERING OTHERS', 'We are dedicated to enriching our community by investing our time in training and employing local artisansand talents with an aim to provide them a fair living with benefits that exceed market standards.', 'home_4.jpg', 'SESSION_TEST', '2017-10-23 15:17:10', 'SESSION_TEST', '2017-10-23 15:20:51'),
(5, 'CELEBRATING INDIVIDUALITY', 'We design our products to be simple and pure, then layer them with artist-illustrated editions to celebrate individuality. Each creation is constructed by hand in small batches, with artisanal craftsmanship.', 'home_5.jpg', 'SESSION_TEST', '2017-10-23 15:17:58', NULL, NULL),
(6, 'CARING FOR OUR WORLD', 'We strive to improve the quality of our work by being responsive of our surroundings and by using sustainable design principles to foster a healthier environment.', 'home_6.jpg', 'SESSION_TEST', '2017-10-23 15:18:36', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_home_gallery`
--

CREATE TABLE `cms_home_gallery` (
  `idData` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `thumbnail` varchar(100) NOT NULL,
  `link` text NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `cms_home_gallery`
--

INSERT INTO `cms_home_gallery` (`idData`, `description`, `thumbnail`, `link`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(2, 'Netflix\'s \'Abstract: The Art of Design\' Will Spotlight the World\'s Most Creative Mind ', 'homeGallery_2_20171206061909pm.jpg', 'http://tulisan.local/page/videoDetail.html?q=6', 'megan@syncard.com', '2017-12-07 00:10:20', 'megan@syncard.com', '2017-12-07 00:19:31'),
(3, 'Netflix\'s \'Abstract: The Art of Design\' Will Spotlight the World\'s Most Creative Mind', 'homeGallery_3_20171206062002pm.jpg', '', 'megan@syncard.com', '2017-12-07 00:20:02', NULL, NULL),
(4, 'Netflix\'s \'Abstract: The Art of Design\' Will Spotlight the World\'s Most Creative Mind', 'homeGallery_4_20171206062019pm.jpg', 'http://tulisan.local/page/videoDetail.html?q=6', 'megan@syncard.com', '2017-12-07 00:20:19', 'admin@tulisan.com', '2017-12-06 10:01:27'),
(5, 'Netflix\'s \'Abstract: The Art of Design\' Will Spotlight the World\'s Most Creative Mind', 'homeGallery_5_20171206062032pm.jpg', '', 'megan@syncard.com', '2017-12-07 00:20:32', NULL, NULL),
(6, 'Netflix\'s \'Abstract: The Art of Design\' Will Spotlight the World\'s Most Creative Mind', 'homeGallery_6_20171206063837pm.jpg', '', 'megan@syncard.com', '2017-12-07 00:38:37', 'megan@syncard.com', '2017-12-07 00:38:50'),
(7, 'Netflix\'s \'Abstract: The Art of Design\' Will Spotlight the World\'s Most Creative Mind', 'homeGallery_7_20171206100508am.gif', '', 'admin@tulisan.com', '2017-12-06 10:05:08', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_story`
--

CREATE TABLE `cms_story` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `cms_story`
--

INSERT INTO `cms_story` (`idData`, `title`, `subtitle`, `description`, `author`, `picture`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(3, 'PEPE AND THE FLYING BALLOON', 'The little girl gave Pepe a big hug and said \"I have been endlessly chasing the horizon running away from monsters that keep haunting me \"', 'PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMzQsIDM0LCAzNCk7IGZvbnQtZmFtaWx5OiBNZW5sbywgbW9ub3NwYWNlOyBmb250LXNpemU6IDExcHg7IHdoaXRlLXNwYWNlOiBwcmUtd3JhcDsiPk9uY2UgdXBvbiBhIHRpbWUsIHRoZXJlIHdlcmUgdHdvIG1pY2UgdGhhdCBsaXZlZCBhbiBhZHZlbnR1cm91cyBsaWZlIGluIHRoZSBoZWFydCBvZiBKYWthcnRhLiBIaXJvIGFuZCBoaXMgd2lmZSwgU3VyLCB3ZXJlIGEgaGFyZC13b3JraW5nIGFuZCBjb3VyYWdlb3VzIGR1by4gRXZlbiB0aG91Z2ggdGhleSB3ZXJlIHRpbnkgY3JlYXR1cmVzLCB0aGVpciBoZWFydHMgd2VyZSBzZXQgb24gcmVzY3VpbmcgYWJhbmRvbmVkIGNoaWxkcmVuIHdobyBsaXZlZCBvbiB0aGUgc3RyZWV0cy4gU29tZXRpbWVzIHRoZXkgc2xlcHQgdW5kZXIgdGhlIHJvb2Z0b3BzIG9mIGJpZyBob3VzZXMsIHdoZXJlIHRoZXkgY291bGQgc3RlYWwgc29tZSBmb29kIGZvciB0aGVzZSBjaGlsZHJlbi4gT3RoZXIgdGltZXMgdGhleSBzcGVudCB0aGUgbmlnaHQgaW4gYSBjbG90aGluZyBmYWN0b3J5LCB3aGVyZSBTdXIgd291bGQgc2V3IGxpdHRsZSBzY2FydmVzIGZyb20gbGVmdG92ZXIgbWF0ZXJpYWxzLiBCdXQgdGhleSBzcGVudCBtb3N0IG9mIHRoZWlyIHRpbWUgdW5kZXIgYSBicmlkZ2UgYXQgdGhlIHZpbnRhZ2UgdHJhaW4gc3RhdGlvbiBpbiBLb3RhIC0gdGhlIG9sZCB0b3duIC0gd2hlcmUgYWJvdXQgdHdlbnR5IHRvIHRoaXJ0eSBuZWdsZWN0ZWQga2lkcyBzb3VnaHQgc2hlbHRlciBlYWNoIG5pZ2h0LiBUaGUgb2xkIGJyaWRnZSBoYWQgYSBuYXN0eSBhbmQgZGFtcCBhdG1vc3BoZXJlLCBidXQgaXQgd2FzIGhlcmUgdGhhdCBIaXJvIGFuZCBTdXIgZmVsdCB0aGV5IHdlcmUgbmVlZGVkIG1vc3QuIEFzIHRoZSBjaGlsZHJlbiBzbGVwdCwgSGlybyB3b3VsZCBjYXJlZnVsbHkgd3JhcCB0aGVpciBuZWNrcyB3aXRoIHRoZSBzY2FydmVzIHRoYXQgU3VyIG1hZGUgYW5kIGdlbnRseSBwbGFjZSBmb29kIG5leHQgdG8gdGhlbS4gTm9uZSBvZiB0aGUga2lkcyBldmVyIGZvdW5kIG91dCB3aG8gdGhlaXIgc2VjcmV0IGd1YXJkaWFucyB0cnVseSB3ZXJlLiANCiANCk1hbnkgbmFtZWxlc3MgY2hpbGRyZW4gd2l0aCBteXN0ZXJpb3VzIHN0b3JpZXMgY2FtZSB0byB0aGlzIGRhcmsgY29ybmVyLiBBZnRlciBhIHdoaWxlLCBzb21lIHdvdWxkIGxlYXZlIHRvIHNlZWsgc2hlbHRlciBlbHNld2hlcmUsIHdoaWxlIG90aGVycyBzdWZmZXJlZCB0cmFnaWMgZW5kcy4gT25lIGRheSwgYSBjaGlsZCB3aXRoIGEgc2hhdmVkIGhlYWQgbGltcGVkIGludG8gdGhpcyBwbGFjZS4gVGhlIGNoaWxk4oCZcyBkYXJrLCB0aGluLCBhbmQgZmxhdCBjaGVzdCBzdWdnZXN0ZWQgdGhhdCBpdCB3YXMgYSBib3kuIFlldCwgc3RhcnJpbmcgZGVlcGx5IGludG8gdGhlIHlvdW5nIHZpc2l0b3LigJlzIGxhcmdlIGFsbW9uZCBleWVzLCBTdXIga25ldyB0aGlzIHBvb3Igc291bCB3YXMgYSBsaXR0bGUgZ2lybC4gSGVyIGV4cHJlc3Npb24gY29udmV5ZWQgYSBtaXggb2YgcmFnZSwgZmVhciwgbG9uZ2luZywgYW5kIHNvcnJvdzsgYnV0IGhlciBleWVzIGhlbGQgdGhlIGJ1cm5pbmcgZmxhbWUgb2YgU3Jpa2FuZGkncyAodGhlIGFuY2llbnQgSmF2YW5lc2Ugd2FycmlvciBnb2RkZXNzKSBzcGlyaXQuIEFjdGluZyBsaWtlIGFuIGFuZ3J5IGJveSB3YXMgaGVyIG1lYW5zIG9mIHN1cnZpdmluZyB0aGUgYWJ1c2UgYW5kIHZpb2xlbmNlIG9mIHRoZSBzdHJlZXRzLiBOb3cgaXQgc2VlbWVkIGFzIGlmIHNoZSBoYWQgYmVlbiBydW5uaW5nIGZvciBob3VycyBmcm9tIHNvbWV0aGluZy4gSGVyIGxpcHMgd2VyZSBwYWxlIGFuZCBjb2xkLiBIZXIgYm9keSB3YXMgc2hha2luZyBmcm9tIGV4aGF1c3Rpb24uIFNoZSBrbmVsdCB0byB0aGUgZ3JvdW5kIGFuZCBmZWxsIGludG8gYSBkZWVwIHNsZWVwIGluc2lkZSBhIHRvcm4gcGFja2luZyBib3ggdGhhdCBIaXJvIGhhZCBwcm9jdXJlZCBmcm9tIHRoZSBmYWN0b3J5LiBFdmVuIGFzIHRoZSBsaXR0bGUgZ2lybCBzbGVwdCwgdGhlcmUgd2FzIGludGVuc2l0eSBvbiBoZXIgZmFjZSwgYW5kIFN1ciBmZWxsIGluIGxvdmUgd2l0aCB0aGUgZ2lybCdzIGZpZ2h0aW5nIHNwaXJpdC4gDQogDQpTdXIgc2F0IGRvd24gbmV4dCB0byBoZXIgYW5kIHN0YXJ0ZWQgdG8gc2V3IGEgdGlueSBkb2xsIHdoaWxlIGh1bW1pbmcgYW4gZW5jaGFudGluZyBsdWxsYWJ5LiBUaGlzIGxvdmluZyBtb3VzZSBoYWQgYSBtaXJhY3Vsb3VzIHBvd2VyIHdoZW4gc2hlIHNld2VkLiBFdmVyeSBzdGl0Y2ggc2hlIG1hZGUgd2FzIHBlcmZvcm1lZCB3aXRoIGEgc29sZW1uIHdpc2ggZm9yIHRoZSBjaGlsZC4gQXMgc2hlIGNvbXBsZXRlZCB0aGUgZG9sbCwgYSBzdGFyIHNob3QgYWNyb3NzIHRoZSBkZWVwIGJsdWUgc2t5IGFib3ZlIHRoZW0uIEl0IGJyb2tlIGludG8gdGlueSBmaXJlZmxpZXMgd2hpY2ggZW52ZWxvcGVkIHRoZSB3aXNoZnVsIGRvbGwgaW4gYSB3YXJtIGdsb3cgYW5kIGJsZXNzZWQgaXQgd2l0aCBhIHNtaWxlLiBTdXIgbmFtZWQgdGhpcyBkb2xsIOKAnFBlcGXigJ0gYWZ0ZXIgdGhlIGxhYmVsIHByaW50ZWQgb24gdGhlIGJveCB3aGVyZSB0aGUgbGl0dGxlIGdpcmwgc2xlcHQuIFdoZW4gc2hlIGdpbmdlcmx5IHBsYWNlZCB0aGUgZG9sbCBpbiB0aGUgY2hpbGQncyBlbWJyYWNlLCBhbiBhaXIgb2Ygam95IGZpbGxlZCB0aGUgZ2lybCdzIGZhY2UsIGFzIGlmIHNoZSBoYWQganVzdCBlbnRlcmVkIGEgbWFnbmlmaWNlbnQgZHJlYW0uIFRoZSBjbHVzdGVyIG9mIGZpcmVmbGllcyB0d2lua2xlZCBhYm92ZSB0aGlzIGdpcmwgYW5kIGxpdCBhbiBpbWFnZSBvZiB3aGF0IHNlZW1lZCB0byBiZSBoZXIgZHJlYW0uIA0KSW4gaGVyIGRyZWFtLCB0aGlzIGxpdHRsZSBnaXJsIGZvdW5kIGhlcnNlbGYgcnVubmluZyB0aHJvdWdoIGEgbXlzdGljYWwgZm9yZXN0LiBTaGUgd2FzIHdlYXJpbmcgYSBsb25nIGNvdHRvbiBkcmVzcyB3aXRoIGh1Z2UgQm91Z2FpbnZpbGxlYSBmbG93ZXJzIHBhaW50ZWQgb24gaXQuIFRoZXJlLCBzaGUgbWV0IFBlcGUgLSBhIHNwYXJrbGluZyBhbmQgd2l0dHkgZG9sbCB3aXRoIGEgd2FybSBodW1hbiBoZWFydC4gUGVwZSBsb3ZlZCBqYXp6IGFuZCBwbGF5ZWQgaGlzIHRydW1wZXQgbGlrZSBhbnkgb3RoZXIgY3JhenkgbXVzaWNpYW4uIFRoZSBtdXNpYyBoZSBwbGF5ZWQgY2FzdCBhIHNwZWxsIHRoYXQgY291bGQgdHVybiBzb21lIGRyZWFtcyBpbnRvIHJlYWxpdHkuIEhlIGxpc3RlbmVkIHRvIGhlciBzdG9yaWVzIGFuZCBtYWRlIGhlciBsYXVnaDsgc29tZXRoaW5nIHRoYXQgc2hlIGhhZCBub3QgZG9uZSBmb3IgYSBsb25nIHRpbWUuIA0KIA0KVGhlIGxpdHRsZSBnaXJsIGdhdmUgUGVwZSBhIGJpZyBodWcgYW5kIHNhaWQsIOKAnEkgaGF2ZSBiZWVuIGVuZGxlc3NseSBjaGFzaW5nIHRoZSBob3Jpem9uLCBydW5uaW5nIGF3YXkgZnJvbSBtb25zdGVycyB0aGF0IGtlZXAgaGF1bnRpbmcgbWUuIERlc3RpbnkgaGFzIGJyb3VnaHQgbWUgdG8geW91LCBzbyB0aGF0IGZvciBhIGZldyBtaW51dGVzIG9mIG15IGxpZmUgSSBjb3VsZCBleHBlcmllbmNlIHdhcm10aCBhbmQgdGVuZGVybmVzcy4gUGxlYXNlIHRha2UgbWUgYXdheSBmcm9tIHRoaXMgZGFyayBwbGFjZSBzbyBJIGNhbiBzdG9wIHJ1bm5pbmcuIEkgd2lzaCB0byBmbHkgYW5kIGJlIGluIGEgd29ybGQgd2hlcmUgSSBjYW4gc3RvcCBwcmV0ZW5kaW5nIHRvIGJlIHNvbWV0aGluZyBJ4oCZbSBub3QgYW5kIGNhbiBiZSBteSB0cnVlIHNlbGYuIA0KIA0KUGVwZSBoZWxkIGhlciBoYW5kIGFuZCBsb29rZWQgaW50byBoZXIgdGVhcnkgZXllcy4gQXMgaGUgd2hpc3RsZWQgYSBtZWxhbmNob2xpYyBtZWxvZHksIGEgc3RyaXBlZCBiYWxsb29uIG1hZ2ljYWxseSBhcHBlYXJlZC4gU2hlIGNsaW1iZWQgdXAgYW5kIHNhdCBvbiB0b3Agb2YgaXQgYXMgaXQgc2xvd2x5IHJvc2UgdG8gdGhlIHNreS4gV2l0aCBhIHNtYWxsIGtpdGUgdG8gbmF2aWdhdGUgdGhlIGJhbGxvb24sIHRoZXkgZm9sbG93ZWQgdGhlIHdpbmQgd2hpY2ggY2FycmllZCB0aGVtIGZyb20gdGhlIGRhcmsgZm9yZXN0LCBvdmVyIHRoZSBtb3VudGFpbnMsIGFib3ZlIHRoZSBjaXRpZXPigJkgc2t5c2NyYXBlcnMsIGFuZCB0aHJvdWdoIHRoZSBjbG91ZHMuIEZyb20gdXAgYWJvdmUsIHNoZSBzYXcgcGVvcGxlIGxpdmluZyBkaWZmZXJlbnQgbGl2ZXMuIFNvbWUgZW5qb3llZCBtb3JlIGZvcnR1bmF0ZSBtb21lbnRzLCB3aGlsZSBvdGhlcnMgaGFkIHRvIGZhY2UgYSBtb3JlIGNoYWxsZW5naW5nIGZhdGUgdGhhbiBoZXJzLiBTaGUgZm91bmQgdGhhdCBzaGUgY291bGQgcGFpbnQgaGVyIGxpZmUgd2l0aCBhbnkgY29sb3JzIHNoZSB3aXNoZWQgYW5kIGRyYXcgaGVyIG93biBob3Jpem9ucyB3aXRob3V0IGhhdmluZyB0byByZWFjaCBvdXQgZm9yIHRoZW0uIFNvcnJvdyBhbmQgbW9uc3RlcnMgZXhpc3RlZCBvbmx5IGluIGhlciBtaW5kLCBub3QgaW4gaGVyIHJlYWxpdHkuIEl0IGFsbCBkZXBlbmRlZCBvbiBob3cgc2hlIGxvb2tlZCBhdCB0aGVtLiBBbmQgbm93IHdpdGggdGhpcyBuZXcgcGVyc3BlY3RpdmUsIHNoZSBmZWx0IGJldHRlci4gDQogDQpTaGUgd2FzIG9uIHRoZSB0b3Agb2YgaGVyIHVuaXZlcnNlIHdoZW4gUGVwZSBnYXZlIGhlciBhIHN1ZGRlbiBraXNzIG9uIHRoZSBjaGVlaywgZmxldyBhd2F5LCBhbmQgZGlzYXBwZWFyZWQgYmVoaW5kIHRoZSBtb29uLiBIZXIgZnVubnkgdmFsZW50aW5lIHdhcyBub3doZXJlIHRvIGJlIHNlZW4uIFRoZSBiYWxsb29uIGRyaWZ0ZWQgZG93biBhdCBhIHNwZWVkIHNoZSBjb3VsZCBub3QgY29udHJvbCwgaGVyIGJyZWF0aCBiZWNhbWUgdGhpbiwgYW5kIHRoZSB3b3JsZCB3YXMgYWdhaW4gYSBmZWFyZnVsIHBsYWNlLiBTaGUgc3VtbW9uZWQgdGhlIHJlbWFpbmluZyBjb3VyYWdlIHRoYXQgc2hlIGhhZCwgdG9vayBhIGRlZXAgYnJlYXRoLCBhbmQgc2xpZCBhd2F5IGZyb20gdGhlIHRvcCBvZiB0aGUgYmFsbG9vbi4gSGVyIHdoaXRlIGNvdHRvbiBkcmVzcyBzZXJ2ZWQgYXMgYSBwYXJhY2h1dGUgc3VjaCB0aGF0IHNoZSBjb3VsZCBsYW5kIGdyYWNlZnVsbHkuIEFzIHNoZSB0b3VjaGVkIHRoZSBncm91bmQsIHRoZSBsaXR0bGUgZ2lybCB3b2tlIHVwIGFuZCBmb3VuZCBoZXJzZWxmIHdpdGggdGhlIGxpdHRsZSBQZXBlIGRvbGwgbmVzdGxlZCBpbiBoZXIgZW1icmFjZS48L3NwYW4+PGJyPg==', 'Melisa Sanjaya', 'stories_3.png', 'SESSION_TEST', '2017-10-23 16:10:18', 'SESSION_TEST', '2017-11-19 13:42:10'),
(4, 'Surat 3', 'Lelono', 'RmFsbCBXaW50ZXIgMTcvMTg=', 'Melissa Sunjaya', 'stories_4_20171207012824am.jpg', 'admin@tulisan.com', '2017-12-07 01:28:24', 'admin@tulisan.com', '2017-12-07 01:29:34'),
(5, 'Letter No. 2: Nexus', 'This Dry Season Collection 2017 relates to Melissa Sunjaya\'s second letter titled â€˜Nexusâ€™. Her essay employed the set theory in mathematics to visualize social and emotional connections between humans.', 'PHAgc3R5bGU9XCJcXFxcXFwmcXVvdDttYXJnaW4tYm90dG9tOlwiIDlweDs9XCJcIiBmb250LXNpemU6PVwiXCIgbGluZS1oZWlnaHQ6PVwiXCIgbm9ybWFsOz1cIlwiIGZvbnQtZmFtaWx5Oj1cIlwiIGdlb3JnaWE7PVwiXCIgY29sb3I6PVwiXCIgcmdiKDAsPVwiXCIgMCw9XCJcIiAwKTs9XCJcIiAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOj1cIlwiIGluaXRpYWw7PVwiXCIgLXdlYmtpdC10ZXh0LXN0cm9rZS1jb2xvcjo9XCJcIiAwKTtcXFxcXFxcIj1cIlwiPgkJIAkgCSAJCTwvcD48ZGl2IGNsYXNzPVwicGFnZVwiIHRpdGxlPVwiUGFnZSA2XCI+CQkJPGRpdiBjbGFzcz1cImxheW91dEFyZWFcIj4JCQkJPGRpdiBjbGFzcz1cImNvbHVtblwiPgkJCQkJPHA+DQoJCQ0KCQ0KCQ0KCQk8L3A+PGRpdiBjbGFzcz1cInBhZ2VcIiB0aXRsZT1cIlBhZ2UgMlwiPg0KCQkJPGRpdiBjbGFzcz1cImxheW91dEFyZWFcIj4NCgkJCQk8ZGl2IGNsYXNzPVwiY29sdW1uXCI+DQoJCQkJCTxwPjxzcGFuIHN0eWxlPVwiZm9udC1zaXplOiAxNC4wMDAwMDBwdDsgZm9udC1mYW1pbHk6IFwnR2VvcmdpYVwnXCI+QWt1IGJlcm5hZmFzLCBiZXJnZXJhaywgZGFuIGJlcmhhc3JhdCBkaQ0Kc3VhdHUgZHVuaWEgYmVyY2FkYXIgeWFuZyB0YWt1dCBkaXNlbnR1aC4NCjwvc3Bhbj48L3A+DQoJCQkJCTxwPjxzcGFuIHN0eWxlPVwiZm9udC1zaXplOiAxNC4wMDAwMDBwdDsgZm9udC1mYW1pbHk6IFwnR2VvcmdpYVwnXCI+QWRhIHlhbmcgc3VrYXIgZGl1bmdrYXBrYW47IHlhbmcgZGlsYXJhbmcNCnVudHVrIGRpc2Vrc2FtYTsgZGFuIHNla2FyYW5nIHNlbWFraW4NCmJhbnlhayBsYWdpIHlhbmcgdGlkYWsgYmlzYSBkaXJhc2FrYW4uDQpTaXN0ZW0geWFuZyBtZW5nZWxpbGluZ2lrdSB0ZWxhaCBkaXJhbmNhbmcNCmphdWggc2ViZWx1bSBha3UgdGVyd3VqdWQgZGFsYW0gamFuaW4uDQpTaXN0ZW0gaW5pIHRpZGFrIGxhZ2kgYmVyZnVuZ3NpIGRlbmdhbiBiYWlrDQp1bnR1ayBtZWxpbmR1bmdpa3UuIFNlcGVydGkgamFyaW5nYW4geWFuZw0KcGFkYXQsIHNpc3RlbSBpbmkgZGlkaXJpa2FuIHVudHVrIG1lbmphZ2ENCmtlc2VpbWJhbmdhbiBkaSBhbnRhcmEgc2VzYW1ha3UuIGtpbmkNCmphcmluZ2FuIHNpc3RlbSBpbmkgbWVuY2FidXRpIHNlZ2FsYSBiZW50dWsNCnNlbnNvcmkgZGFyaSByYXNhIGtlbWFudXNpYWFua3UsIGRhbg0KbWVyZWtheWFzYW55YSBkZW5nYW4gcGVyc29uYWxpc2FzaSBsYWluLjwvc3Bhbj48L3A+DQoJCQkJPC9kaXY+DQoJCQk8L2Rpdj4NCgkJPC9kaXY+CQkJCTwvZGl2PgkJCTwvZGl2PgkJPC9kaXY+', 'Melissa Sunjaya', 'stories_5_20171207013417am.jpg', 'admin@tulisan.com', '2017-12-07 01:34:17', 'admin@tulisan.com', '2017-12-17 20:43:17'),
(9, 'Letter No. 1: Pulsar Dance', 'This Fall-Winter 2016-2017 season is derived from the  rst letter of my anthology titled â€˜The New East Indiesâ€™ in which I tried to examine new perspectives on several aspects of social orders and cultural values.', 'DQoJCQ0KCQ0KCQ0KCQk8ZGl2IGNsYXNzPVxcXCJwYWdlXFxcIiB0aXRsZT1cXFwiUGFnZSA2XFxcIj4NCgkJCTxkaXYgY2xhc3M9XFxcImxheW91dEFyZWFcXFwiPg0KCQkJCTxkaXYgY2xhc3M9XFxcImNvbHVtblxcXCI+DQoJCQkJCTxwPjxzcGFuIHN0eWxlPVxcXCJmb250LXNpemU6IDkuMDAwMDAwcHQ7IGZvbnQtZmFtaWx5OiBcXFwnR2VvcmdpYVxcXCdcXFwiPlRoaXMgRmFsbC1XaW50ZXIgMjAxNi0yMDE3IHNlYXNvbiBpcyBkZXJpdmVkIGZyb20gdGhlIGZpcnN0IGxldHRlciBvZg0KPC9zcGFuPjxzcGFuIHN0eWxlPVxcXCJmb250LXNpemU6IDkuMDAwMDAwcHQ7IGZvbnQtZmFtaWx5OiBcXFwnR2VvcmdpYVxcXCdcXFwiPk1lbGlzc2EgU3VuamF5YVxcXCdzIGFudGhvbG9neSB0aXRsZWQg4oCYVGhlIE5ldyBFYXN0IEluZGllcyzigJkgaW4gd2hpY2ggc2hlIHRyaWVkIHRvIGV4YW1pbmUNCm5ldyBwZXJzcGVjdGl2ZXMgb24gc2V2ZXJhbCBhc3BlY3RzIG9mIHNvY2lhbCBvcmRlcnMgYW5kIGN1bHR1cmFsDQp2YWx1ZXMuPC9zcGFuPjwvcD4NCgkJCQk8L2Rpdj4NCgkJCTwvZGl2Pg0KCQk8L2Rpdj4=', 'Melissa Sunjaya', 'stories_9_20171217083801pm.jpg', 'admin@tulisan.com', '2017-12-17 20:38:01', 'aryaputra@tulisan.com', '2017-12-17 20:40:19'),
(10, 'Anima', '', '', 'Melissa Sunjaya & SÃ©bastien ThÃ©raulaz', '', 'aryaputra@tulisan.com', '2017-12-17 22:19:58', NULL, NULL),
(11, 'The Sound of Dawn', '', '', 'Melissa Sunjaya', '', '', '2017-12-17 23:15:45', 'aryaputra@tulisan.com', '2017-12-18 09:27:52'),
(12, 'Les Papillons de Victor', '', 'PGJyPg==', 'Melissa Sunjaya & Virginie Kasse', '', '', '2017-12-17 23:17:40', NULL, NULL),
(13, 'Amma Supahilo', '', '', 'Melissa Sunjaya', '', '', '2017-12-17 23:18:12', NULL, NULL),
(14, 'Hotel Batavia', '', 'PGJyPg==', 'Melissa Sunjaya & Rassi Narika', '', '', '2017-12-17 23:19:17', NULL, NULL),
(15, 'Love Letters of Roro Mendut', '', 'PGJyPg==', 'Melissa Sunjaya', '', '', '2017-12-17 23:19:53', NULL, NULL),
(16, 'Admiral Kasarung', '', 'PGJyPg==', 'Melissa Sunjaya & Rassi Narika', '', '', '2017-12-17 23:20:17', NULL, NULL),
(17, 'Bio Fantasy', '', 'PGJyPg==', 'Melissa Sunjaya', '', '', '2017-12-17 23:20:41', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_story_artwork`
--

CREATE TABLE `cms_story_artwork` (
  `idData` int(11) NOT NULL,
  `idStory` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `cms_story_artwork`
--

INSERT INTO `cms_story_artwork` (`idData`, `idStory`, `name`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(4, 9, 'Tessitura', 'admin@tulisan.com', '2017-12-17 20:50:08', NULL, NULL),
(5, 9, 'Filogenesis', 'admin@tulisan.com', '2017-12-17 20:50:36', NULL, NULL),
(6, 9, 'Deformasi', 'admin@tulisan.com', '2017-12-17 20:51:46', NULL, NULL),
(7, 9, 'Transgresi', 'admin@tulisan.com', '2017-12-17 20:52:12', NULL, NULL),
(8, 9, 'Deviasi', 'admin@tulisan.com', '2017-12-17 20:52:37', NULL, NULL),
(9, 9, 'Fuga', 'admin@tulisan.com', '2017-12-17 20:52:45', NULL, NULL),
(10, 5, 'Kristalisasi', 'admin@tulisan.com', '2017-12-17 20:53:18', NULL, NULL),
(11, 5, 'Kohesi', 'admin@tulisan.com', '2017-12-17 20:53:44', NULL, NULL),
(12, 5, 'Asimilasi', 'admin@tulisan.com', '2017-12-17 20:54:23', NULL, NULL),
(13, 5, 'Lokus', 'admin@tulisan.com', '2017-12-17 20:54:47', NULL, NULL),
(14, 5, 'Gabungan', 'admin@tulisan.com', '2017-12-17 20:55:18', NULL, NULL),
(15, 5, 'Perluasan', 'admin@tulisan.com', '2017-12-17 20:55:38', NULL, NULL),
(16, 5, 'Irisan', 'admin@tulisan.com', '2017-12-17 20:59:01', NULL, NULL),
(17, 5, 'Relasi', 'admin@tulisan.com', '2017-12-17 20:59:12', NULL, NULL),
(18, 9, 'Surat 1', 'aryaputra@tulisan.com', '2017-12-18 09:19:08', 'aryaputra@tulisan.com', '2017-12-18 09:30:19'),
(19, 5, 'Surat 2', 'aryaputra@tulisan.com', '2017-12-18 09:19:37', 'aryaputra@tulisan.com', '2017-12-18 09:31:14'),
(20, 11, 'Terbit', 'aryaputra@tulisan.com', '2017-12-18 09:19:58', NULL, NULL),
(21, 11, 'Embun', 'aryaputra@tulisan.com', '2017-12-18 09:20:56', NULL, NULL),
(22, 11, 'Orkestra', 'aryaputra@tulisan.com', '2017-12-18 09:25:52', NULL, NULL),
(23, 11, 'Jantan', 'aryaputra@tulisan.com', '2017-12-18 09:26:31', NULL, NULL),
(24, 11, 'Betina', 'aryaputra@tulisan.com', '2017-12-18 09:26:47', NULL, NULL),
(25, 11, 'Pete', 'aryaputra@tulisan.com', '2017-12-18 09:27:14', NULL, NULL),
(26, 17, 'Nocturno', '', '2017-12-19 04:32:21', NULL, NULL),
(27, 0, 'Jane', '', '2017-12-19 04:46:10', NULL, NULL),
(28, 0, 'Jane', '', '2017-12-19 04:47:07', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_video`
--

CREATE TABLE `cms_video` (
  `idData` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `fileName` varchar(100) NOT NULL,
  `fileSize` varchar(10) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `cms_video`
--

INSERT INTO `cms_video` (`idData`, `title`, `description`, `fileName`, `fileSize`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(4, 'Finding Unconditional Love', 'DQoNCg0KDQoNCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQpwLnAxIHttYXJnaW46IDAuMHB4IDAuMHB4IDAuMHB4IDAuMHB4OyBmb250OiAxMi4wcHggJ0hlbHZldGljYSBOZXVlJzsgY29sb3I6ICM0NTQ1NDV9DQo8L3N0eWxlPg0KDQoNCjxwIGNsYXNzPSJwMSI+VGhlIFNvdW5kIG9mIERhd27igJksIGFuIGFydCBwcm9qZWN0IGJ5IG11bHRpLWRpbWVuc2lvbmFsIGFydGlzdCBNZWxpc3NhIFN1bmpheWEsIGV4YW1pbmVzIHRoZSBjb25jZXB0IG9mIHNlbGYtbG92ZS4gVGhpcyBzZW5zdWFsIHByb3NlIGlzIGFib3V0IGEgc3Bpcml0dWFsIGF3YWtlbmluZyB0byBkaXNjb3ZlciBibGlzcyBhbmQgaGFwcGluZXNzIHdpdGhpbiBvdXJzZWx2ZXMuIE9ubHkgdGhyb3VnaCBhIGNvbW1pdG1lbnQgb2YgbG92aW5nIG91cnNlbHZlcyB3aG9sZWhlYXJ0ZWRseSwgd2UgY2FuIGJlZ2luIHRvIGxvdmUgb3RoZXJzIHVuY29uZGl0aW9uYWxseS48L3A+DQo8cCBjbGFzcz0icDEiPldlIHJlY2VudGx5IHNhdCBkb3duIHdpdGggZGVzaWduZXIgWmhpanVuIFdhbmcgdG8gZGlzY3VzcyBoaXMgcHJvamVjdCB0aGF0IHR1cm5zIGh5cGVkIHNuZWFrZXJzIGludG8gd2VhcmFibGUgZmFjZSBtYXNrcy4gVGhlIEJlaWppbmctYmFzZWQgY3JlYXRpdmUgc3RhcnRlZCBoaXMgZmFjZSBtYXNrIHByb2plY3QgdG8gY29tbWVudCBvbiB0aGUgcG9sbHV0aW9uIGluIGhpcyBjaXR5LCB3aGVyZSBjaXRpemVucyBhcmUgYmF0dGxpbmcgZXh0cmVtZSBhaXIgcG9sbHV0aW9uLiBVbmRlcnN0YW5kYWJseSwgV2FuZ+KAmXMgbWFzayBwcm9qZWN0cyBoYXZlIGJlZW4gbWV0IHdpdGggbWl4ZWQgcmVzcG9uc2VzIGFuZCBoYXZlIGNyZWF0ZWQgcXVpdGUgYSBidXp6IG9uIHRoZSBpbnRlcm5ldC4gSW4gb3VyIHRhbGsgd2l0aCBXYW5nIGhlIG5vdGVzIHRoYXQgaGUgb25seSB3aXNoZXMgdG8gbWFrZSBpbnRlcmVzdGluZyBpdGVtcyB0aGF0IG5vIG9uZSBoYXMgbWFkZSBiZWZvcmUgYW5kIHRoYXQgaGUgaGFzIG5vIGludGVyZXN0IGluIHNlbGxpbmcgaGlzIG1hc2tzLiBBZGRpdGlvbmFsbHksIHdlIGdhdmUgYSBwYWlyIG9mIG91ciBIWVBFQkVBU1QgMjB0aCBhbm5pdmVyc2FyeSBOZXcgQmFsYW5jZSA1ODAg4oCcRWFydGjigJ0gc25lYWtlcnMgdG8gV2FuZyB0byBiZSBtYWRlIGludG8gb25lIG9mIGhpcyBzaWduYXR1cmUgZmFjZSBtYXNrcy48L3A+', '9uHbDLJgxwQ', '10221416', 'SESSION_TEST', '2017-10-23 18:33:00', 'SESSION_TEST', '2017-11-16 16:30:58'),
(5, 'Melisa Sunjaya | Tulisan: Jangan Pernah Takut!', 'PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMTcsIDE3LCAxNyk7IGZvbnQtZmFtaWx5OiBSb2JvdG8sIEFyaWFsLCBzYW5zLXNlcmlmOyB3aGl0ZS1zcGFjZTogcHJlLXdyYXA7Ij5NZWxpc2EgU3VuamF5YSwgbWVuZ2Vrc3ByZXNpa2FuIHNlbXVhIHBlcmFzYWFubnlhIGxld2F0IGthcnlhLWthcnlhbnlhIHlhbmcgZWtza2x1c2lmIGRhbiByYW1haCBsaW5na3VuZ2FuLiANCg0KSWRlYUZlc3QgbWVydXBha2FuIGdlcmFrYW4ga3JlYXRpZiB1bnR1ayBtZW5jaXB0YWthbiBha3NpIG55YXRhLiBCZXJzYW1hIGRlbmdhbiBwYXJhIHRva29oIGR1bmlhIHNlcGVydGkgU3RlZmFuIFNhZ21laXN0ZXIsIEJhc3VraSBQdXJuYW1hLCBBbmllcyBCYXN3ZWRhbiwgZGFuIFBldGVyIEdvbnRoYSwgSWRlYUZlc3QgdGVsYWggYmVyYmFnaSBpZGUsIGluc3BpcmFzaSwgZGFuIHBlbmdhbGFtYW4ga2VwYWRhIHJpYnVhbiB0YWxlbnRhIG11ZGEgSW5kb25lc2lhLiBUYWh1biBpbmksIGthbWkgcGVyc2VtYmFoa2FuIGtodXN1cyB1bnR1ayBJbmRvbmVzaWEgc2VidWFoIG5pbGFpIG55YXRhIHRlbnRhbmcgIkNyZWF0aXZpdHkgd2l0aCBQdXJwb3NlIi4NCg0KVW50dWsgaW5mb3JtYXNpIHNlbGVuZ2thcG55YSwga3VuanVuZ2kgd3d3LmlkZWFmZXN0LmlkIQ0KDQpGYWNlYm9vazogPC9zcGFuPjxhIGNsYXNzPSJ5dC1zaW1wbGUtZW5kcG9pbnQgc3R5bGUtc2NvcGUgeXQtZm9ybWF0dGVkLXN0cmluZyIgaHJlZj0iaHR0cHM6Ly93d3cueW91dHViZS5jb20vcmVkaXJlY3Q/cmVkaXJfdG9rZW49T1VFVU1ETmR2c2dtS0Iyc0dVc2x3NmlZVnBWOE1UVXhNRGt4TVRBMk9VQXhOVEV3T0RJME5qWTUmYW1wO2V2ZW50PXZpZGVvX2Rlc2NyaXB0aW9uJmFtcDt2PXh2ajVEN0pCOEtFJmFtcDtxPWh0dHBzJTNBJTJGJTJGd3d3LmZhY2Vib29rLmNvbSUyRmlkZWFmZXN0IiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrOyBjdXJzb3I6IHBvaW50ZXI7IGNvbG9yOiB2YXIoLS15dC1lbmRwb2ludC1jb2xvcik7IGZvbnQtZmFtaWx5OiBSb2JvdG8sIEFyaWFsLCBzYW5zLXNlcmlmOyB3aGl0ZS1zcGFjZTogcHJlLXdyYXA7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTUsIDI1NSwgMjU1KTsiPmh0dHBzOi8vd3d3LmZhY2Vib29rLmNvbS9pZGVhZmVzdDwvYT48c3BhbiBzdHlsZT0iY29sb3I6IHJnYigxNywgMTcsIDE3KTsgZm9udC1mYW1pbHk6IFJvYm90bywgQXJpYWwsIHNhbnMtc2VyaWY7IHdoaXRlLXNwYWNlOiBwcmUtd3JhcDsiPg0KVHdpdHRlcjogPC9zcGFuPjxhIGNsYXNzPSJ5dC1zaW1wbGUtZW5kcG9pbnQgc3R5bGUtc2NvcGUgeXQtZm9ybWF0dGVkLXN0cmluZyIgaHJlZj0iaHR0cHM6Ly93d3cueW91dHViZS5jb20vcmVkaXJlY3Q/cmVkaXJfdG9rZW49T1VFVU1ETmR2c2dtS0Iyc0dVc2x3NmlZVnBWOE1UVXhNRGt4TVRBMk9VQXhOVEV3T0RJME5qWTUmYW1wO2V2ZW50PXZpZGVvX2Rlc2NyaXB0aW9uJmFtcDt2PXh2ajVEN0pCOEtFJmFtcDtxPWh0dHBzJTNBJTJGJTJGdHdpdHRlci5jb20lMkZpZGVhZmVzdCIgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazsgY3Vyc29yOiBwb2ludGVyOyBjb2xvcjogdmFyKC0teXQtZW5kcG9pbnQtY29sb3IpOyBmb250LWZhbWlseTogUm9ib3RvLCBBcmlhbCwgc2Fucy1zZXJpZjsgd2hpdGUtc3BhY2U6IHByZS13cmFwOyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7Ij5odHRwczovL3R3aXR0ZXIuY29tL2lkZWFmZXN0PC9hPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDE3LCAxNywgMTcpOyBmb250LWZhbWlseTogUm9ib3RvLCBBcmlhbCwgc2Fucy1zZXJpZjsgd2hpdGUtc3BhY2U6IHByZS13cmFwOyI+DQpJbnN0YWdyYW06IDwvc3Bhbj48YSBjbGFzcz0ieXQtc2ltcGxlLWVuZHBvaW50IHN0eWxlLXNjb3BlIHl0LWZvcm1hdHRlZC1zdHJpbmciIGhyZWY9Imh0dHBzOi8vd3d3LnlvdXR1YmUuY29tL3JlZGlyZWN0P3JlZGlyX3Rva2VuPU9VRVVNRE5kdnNnbUtCMnNHVXNsdzZpWVZwVjhNVFV4TURreE1UQTJPVUF4TlRFd09ESTBOalk1JmFtcDtldmVudD12aWRlb19kZXNjcmlwdGlvbiZhbXA7dj14dmo1RDdKQjhLRSZhbXA7cT1odHRwcyUzQSUyRiUyRmluc3RhZ3JhbS5jb20lMkZpZGVhZmVzdGlkIiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrOyBjdXJzb3I6IHBvaW50ZXI7IGNvbG9yOiB2YXIoLS15dC1lbmRwb2ludC1jb2xvcik7IGZvbnQtZmFtaWx5OiBSb2JvdG8sIEFyaWFsLCBzYW5zLXNlcmlmOyB3aGl0ZS1zcGFjZTogcHJlLXdyYXA7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTUsIDI1NSwgMjU1KTsiPmh0dHBzOi8vaW5zdGFncmFtLmNvbS9pZGVhZmVzdGlkPC9hPjxicj4=', 'xvj5D7JB8KE', '', 'SESSION_TEST', '2017-11-16 16:32:02', NULL, NULL),
(6, 'Tulisan - The making of Surat No. 2 (Videographer: Art Director)', 'PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMTcsIDE3LCAxNyk7IGZvbnQtZmFtaWx5OiBSb2JvdG8sIEFyaWFsLCBzYW5zLXNlcmlmOyB3aGl0ZS1zcGFjZTogcHJlLXdyYXA7Ij5UaGUgbWFraW5nIG9mIFN1cmF0IE5vLiAyOiBQZXJzaW5nZ3VuZ2FuIG9mIFZpZGVvZ3JhcGhlci4NCg0KVGhlIHZpc3VhbCBlc3NheSB0ZWFtOg0KQ2hpZWYgb2YgUmVzZWFyY2ggJmFtcDsgQ3VyYXRvcnNoaXAgLSBNZWxpc3NhIFN1bmpheWENCkRlcHV0eSBvZiBSZXNlYXJjaCAmYW1wOyBDdXJhdG9yc2hpcCAtIE11aGFtbWFkIFp1bGZhZGx5DQpQcm9ncmFtIERpcmVjdG9yIC0gUmFobWEgQXl1DQpWaXN1YWwgRGlyZWN0b3IgLSBLcmlzaG5pIFN3YW5kYXlhbmkNCkFydCBEaXJlY3RvciAtIEJpbWEgQ2hyaXMNClBob3RvZ3JhcGhlciAtIFpoYXJmYW5pIFBhZG1hc2VkaGFuYQ0KRWRpdG9yIC0gTWVsYW55IFp3YXJ0amVzDQpTdHlsZSBEaXJlY3RvciAtIEFqaSBCYWdqYXJheWENClByb3BzIE1hc3RlciAtIEFyeWEgSXJoYXNkaW5hdGENClN0YWdlIERlc2lnbmVyIC0gRmFyaWQgUmluYWxkaQ0KQ29zdHVtZSBNYW5hZ2VyIC0gRmFkcmkgUGFtdW5na2FzPC9zcGFuPjxicj4=', 'iQmNxsAKPfg', '', 'SESSION_TEST', '2017-11-16 16:33:38', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `colors`
--

CREATE TABLE `colors` (
  `idData` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `colors`
--

INSERT INTO `colors` (`idData`, `name`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(3, 'Blue Note', 'SESSION_TEST', '2017-10-23 14:39:48', 'admin@tulisan.com', '2017-12-05 02:17:03'),
(4, 'Fuchsia Fantasia', 'admin@tulisan.com', '2017-11-29 18:45:06', 'admin@tulisan.com', '2017-12-05 02:18:18'),
(6, 'Light Snow', 'admin@tulisan.com', '2017-12-05 23:11:44', NULL, NULL),
(7, 'Green Grass', 'admin@tulisan.com', '2017-12-13 00:12:57', 'admin@tulisan.com', '2017-12-13 00:15:00'),
(8, 'Blue', 'admin@tulisan.com', '2017-12-14 09:42:26', NULL, NULL),
(9, 'Blue Capri', 'admin@tulisan.com', '2017-12-14 09:42:53', NULL, NULL),
(10, 'Blue Bell', 'admin@tulisan.com', '2017-12-14 09:43:15', NULL, NULL),
(11, 'Blue Sky', 'admin@tulisan.com', '2017-12-14 09:43:37', NULL, NULL),
(12, 'Cyan', 'admin@tulisan.com', '2017-12-14 09:43:50', NULL, NULL),
(13, 'Fuchsia Desert', 'admin@tulisan.com', '2017-12-14 09:45:10', NULL, NULL),
(14, 'Fuchsia Berry', 'admin@tulisan.com', '2017-12-14 09:45:30', NULL, NULL),
(15, 'Fuchsia Pink', 'admin@tulisan.com', '2017-12-14 09:45:48', NULL, NULL),
(16, 'Green', 'admin@tulisan.com', '2017-12-14 09:46:10', NULL, NULL),
(17, 'Green Lime', 'admin@tulisan.com', '2017-12-14 09:46:34', NULL, NULL),
(18, 'Green Winter', 'admin@tulisan.com', '2017-12-14 09:47:07', NULL, NULL),
(19, 'Nero Jet', 'admin@tulisan.com', '2017-12-14 09:47:34', NULL, NULL),
(20, 'Green Tea', 'admin@tulisan.com', '2017-12-14 09:48:13', NULL, NULL),
(21, 'Light Coco', 'admin@tulisan.com', '2017-12-14 09:48:49', NULL, NULL),
(22, 'Light Lemon', 'admin@tulisan.com', '2017-12-14 09:49:03', NULL, NULL),
(23, 'Nero Burgundy', 'admin@tulisan.com', '2017-12-14 09:49:36', NULL, NULL),
(24, 'Orange Oriental', 'admin@tulisan.com', '2017-12-14 09:49:55', NULL, NULL),
(25, 'Orange Salmon', 'admin@tulisan.com', '2017-12-14 09:50:13', NULL, NULL),
(26, 'Orange Tangerine', 'admin@tulisan.com', '2017-12-14 09:50:37', NULL, NULL),
(27, 'Pink', 'admin@tulisan.com', '2017-12-14 09:51:03', NULL, NULL),
(28, 'Purple Plum', 'admin@tulisan.com', '2017-12-14 09:51:58', NULL, NULL),
(29, 'Red', 'admin@tulisan.com', '2017-12-14 09:52:08', NULL, NULL),
(30, 'Red Blush', 'admin@tulisan.com', '2017-12-14 09:52:40', NULL, NULL),
(31, 'Red Letter', 'admin@tulisan.com', '2017-12-14 09:53:19', NULL, NULL),
(32, 'Red Rumor', 'admin@tulisan.com', '2017-12-14 09:53:49', NULL, NULL),
(33, 'Red Sangria', 'admin@tulisan.com', '2017-12-14 09:53:58', NULL, NULL),
(34, 'Red Wine', 'admin@tulisan.com', '2017-12-14 09:54:23', NULL, NULL),
(35, 'Smokey Lunar', 'admin@tulisan.com', '2017-12-14 09:54:38', NULL, NULL),
(36, 'Smokey Sage', 'admin@tulisan.com', '2017-12-14 09:55:00', NULL, NULL),
(37, 'Smokey Night', 'admin@tulisan.com', '2017-12-14 09:55:27', NULL, NULL),
(38, 'Smokey Ash', 'admin@tulisan.com', '2017-12-14 09:55:50', NULL, NULL),
(39, 'Smokey Plum', 'admin@tulisan.com', '2017-12-14 09:56:08', NULL, NULL),
(40, 'Teal Jade', 'admin@tulisan.com', '2017-12-14 09:56:34', NULL, NULL),
(41, 'Teal Mint', 'admin@tulisan.com', '2017-12-14 09:56:48', NULL, NULL),
(42, 'Teal Pool', 'admin@tulisan.com', '2017-12-14 09:57:02', NULL, NULL),
(43, 'Turquoise', 'admin@tulisan.com', '2017-12-14 09:57:35', NULL, NULL),
(44, 'Yellow', 'admin@tulisan.com', '2017-12-14 09:57:55', NULL, NULL),
(45, 'Yellow Butter', 'admin@tulisan.com', '2017-12-14 09:58:13', NULL, NULL),
(46, 'Yellow Canary', 'admin@tulisan.com', '2017-12-14 09:58:31', NULL, NULL),
(47, 'Yellow Mustard', 'admin@tulisan.com', '2017-12-14 09:59:01', NULL, NULL),
(48, 'Yellow Olive', 'admin@tulisan.com', '2017-12-14 09:59:21', NULL, NULL),
(49, 'Yellow Sunflower', 'admin@tulisan.com', '2017-12-14 09:59:47', NULL, NULL),
(50, 'Yellow Sunshine', 'admin@tulisan.com', '2017-12-14 10:00:15', NULL, NULL),
(51, 'Nero Indigo', 'admin@tulisan.com', '2017-12-14 10:00:29', NULL, NULL),
(52, 'Nero Forest', 'admin@tulisan.com', '2017-12-14 10:01:34', NULL, NULL),
(53, 'Nero Velvet', 'admin@tulisan.com', '2017-12-14 10:02:15', NULL, NULL),
(54, 'Green Herb', 'admin@tulisan.com', '2017-12-14 10:02:30', NULL, NULL),
(55, 'Nero Coffe', 'admin@tulisan.com', '2017-12-14 10:02:55', 'admin@tulisan.com', '2017-12-14 10:03:13'),
(56, 'Purple Rain', 'admin@tulisan.com', '2017-12-14 10:03:36', NULL, NULL),
(57, 'Light Ecru', 'admin@tulisan.com', '2017-12-14 10:04:14', NULL, NULL),
(58, 'Teal Sea', 'aryaputra@tulisan.com', '2017-12-15 05:12:43', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `country_name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AL', 'Albania'),
(3, 'DZ', 'Algeria'),
(4, 'DS', 'American Samoa'),
(5, 'AD', 'Andorra'),
(6, 'AO', 'Angola'),
(7, 'AI', 'Anguilla'),
(8, 'AQ', 'Antarctica'),
(9, 'AG', 'Antigua and Barbuda'),
(10, 'AR', 'Argentina'),
(11, 'AM', 'Armenia'),
(12, 'AW', 'Aruba'),
(13, 'AU', 'Australia'),
(14, 'AT', 'Austria'),
(15, 'AZ', 'Azerbaijan'),
(16, 'BS', 'Bahamas'),
(17, 'BH', 'Bahrain'),
(18, 'BD', 'Bangladesh'),
(19, 'BB', 'Barbados'),
(20, 'BY', 'Belarus'),
(21, 'BE', 'Belgium'),
(22, 'BZ', 'Belize'),
(23, 'BJ', 'Benin'),
(24, 'BM', 'Bermuda'),
(25, 'BT', 'Bhutan'),
(26, 'BO', 'Bolivia'),
(27, 'BA', 'Bosnia and Herzegovina'),
(28, 'BW', 'Botswana'),
(29, 'BV', 'Bouvet Island'),
(30, 'BR', 'Brazil'),
(31, 'IO', 'British Indian Ocean Territory'),
(32, 'BN', 'Brunei Darussalam'),
(33, 'BG', 'Bulgaria'),
(34, 'BF', 'Burkina Faso'),
(35, 'BI', 'Burundi'),
(36, 'KH', 'Cambodia'),
(37, 'CM', 'Cameroon'),
(38, 'CA', 'Canada'),
(39, 'CV', 'Cape Verde'),
(40, 'KY', 'Cayman Islands'),
(41, 'CF', 'Central African Republic'),
(42, 'TD', 'Chad'),
(43, 'CL', 'Chile'),
(44, 'CN', 'China'),
(45, 'CX', 'Christmas Island'),
(46, 'CC', 'Cocos (Keeling) Islands'),
(47, 'CO', 'Colombia'),
(48, 'KM', 'Comoros'),
(49, 'CG', 'Congo'),
(50, 'CK', 'Cook Islands'),
(51, 'CR', 'Costa Rica'),
(52, 'HR', 'Croatia (Hrvatska)'),
(53, 'CU', 'Cuba'),
(54, 'CY', 'Cyprus'),
(55, 'CZ', 'Czech Republic'),
(56, 'DK', 'Denmark'),
(57, 'DJ', 'Djibouti'),
(58, 'DM', 'Dominica'),
(59, 'DO', 'Dominican Republic'),
(60, 'TP', 'East Timor'),
(61, 'EC', 'Ecuador'),
(62, 'EG', 'Egypt'),
(63, 'SV', 'El Salvador'),
(64, 'GQ', 'Equatorial Guinea'),
(65, 'ER', 'Eritrea'),
(66, 'EE', 'Estonia'),
(67, 'ET', 'Ethiopia'),
(68, 'FK', 'Falkland Islands (Malvinas)'),
(69, 'FO', 'Faroe Islands'),
(70, 'FJ', 'Fiji'),
(71, 'FI', 'Finland'),
(72, 'FR', 'France'),
(73, 'FX', 'France, Metropolitan'),
(74, 'GF', 'French Guiana'),
(75, 'PF', 'French Polynesia'),
(76, 'TF', 'French Southern Territories'),
(77, 'GA', 'Gabon'),
(78, 'GM', 'Gambia'),
(79, 'GE', 'Georgia'),
(80, 'DE', 'Germany'),
(81, 'GH', 'Ghana'),
(82, 'GI', 'Gibraltar'),
(83, 'GK', 'Guernsey'),
(84, 'GR', 'Greece'),
(85, 'GL', 'Greenland'),
(86, 'GD', 'Grenada'),
(87, 'GP', 'Guadeloupe'),
(88, 'GU', 'Guam'),
(89, 'GT', 'Guatemala'),
(90, 'GN', 'Guinea'),
(91, 'GW', 'Guinea-Bissau'),
(92, 'GY', 'Guyana'),
(93, 'HT', 'Haiti'),
(94, 'HM', 'Heard and Mc Donald Islands'),
(95, 'HN', 'Honduras'),
(96, 'HK', 'Hong Kong'),
(97, 'HU', 'Hungary'),
(98, 'IS', 'Iceland'),
(99, 'IN', 'India'),
(100, 'IM', 'Isle of Man'),
(101, 'ID', 'Indonesia'),
(102, 'IR', 'Iran (Islamic Republic of)'),
(103, 'IQ', 'Iraq'),
(104, 'IE', 'Ireland'),
(105, 'IL', 'Israel'),
(106, 'IT', 'Italy'),
(107, 'CI', 'Ivory Coast'),
(108, 'JE', 'Jersey'),
(109, 'JM', 'Jamaica'),
(110, 'JP', 'Japan'),
(111, 'JO', 'Jordan'),
(112, 'KZ', 'Kazakhstan'),
(113, 'KE', 'Kenya'),
(114, 'KI', 'Kiribati'),
(115, 'KP', 'Korea, Democratic People\'s Republic of'),
(116, 'KR', 'Korea, Republic of'),
(117, 'XK', 'Kosovo'),
(118, 'KW', 'Kuwait'),
(119, 'KG', 'Kyrgyzstan'),
(120, 'LA', 'Lao People\'s Democratic Republic'),
(121, 'LV', 'Latvia'),
(122, 'LB', 'Lebanon'),
(123, 'LS', 'Lesotho'),
(124, 'LR', 'Liberia'),
(125, 'LY', 'Libyan Arab Jamahiriya'),
(126, 'LI', 'Liechtenstein'),
(127, 'LT', 'Lithuania'),
(128, 'LU', 'Luxembourg'),
(129, 'MO', 'Macau'),
(130, 'MK', 'Macedonia'),
(131, 'MG', 'Madagascar'),
(132, 'MW', 'Malawi'),
(133, 'MY', 'Malaysia'),
(134, 'MV', 'Maldives'),
(135, 'ML', 'Mali'),
(136, 'MT', 'Malta'),
(137, 'MH', 'Marshall Islands'),
(138, 'MQ', 'Martinique'),
(139, 'MR', 'Mauritania'),
(140, 'MU', 'Mauritius'),
(141, 'TY', 'Mayotte'),
(142, 'MX', 'Mexico'),
(143, 'FM', 'Micronesia, Federated States of'),
(144, 'MD', 'Moldova, Republic of'),
(145, 'MC', 'Monaco'),
(146, 'MN', 'Mongolia'),
(147, 'ME', 'Montenegro'),
(148, 'MS', 'Montserrat'),
(149, 'MA', 'Morocco'),
(150, 'MZ', 'Mozambique'),
(151, 'MM', 'Myanmar'),
(152, 'NA', 'Namibia'),
(153, 'NR', 'Nauru'),
(154, 'NP', 'Nepal'),
(155, 'NL', 'Netherlands'),
(156, 'AN', 'Netherlands Antilles'),
(157, 'NC', 'New Caledonia'),
(158, 'NZ', 'New Zealand'),
(159, 'NI', 'Nicaragua'),
(160, 'NE', 'Niger'),
(161, 'NG', 'Nigeria'),
(162, 'NU', 'Niue'),
(163, 'NF', 'Norfolk Island'),
(164, 'MP', 'Northern Mariana Islands'),
(165, 'NO', 'Norway'),
(166, 'OM', 'Oman'),
(167, 'PK', 'Pakistan'),
(168, 'PW', 'Palau'),
(169, 'PS', 'Palestine'),
(170, 'PA', 'Panama'),
(171, 'PG', 'Papua New Guinea'),
(172, 'PY', 'Paraguay'),
(173, 'PE', 'Peru'),
(174, 'PH', 'Philippines'),
(175, 'PN', 'Pitcairn'),
(176, 'PL', 'Poland'),
(177, 'PT', 'Portugal'),
(178, 'PR', 'Puerto Rico'),
(179, 'QA', 'Qatar'),
(180, 'RE', 'Reunion'),
(181, 'RO', 'Romania'),
(182, 'RU', 'Russian Federation'),
(183, 'RW', 'Rwanda'),
(184, 'KN', 'Saint Kitts and Nevis'),
(185, 'LC', 'Saint Lucia'),
(186, 'VC', 'Saint Vincent and the Grenadines'),
(187, 'WS', 'Samoa'),
(188, 'SM', 'San Marino'),
(189, 'ST', 'Sao Tome and Principe'),
(190, 'SA', 'Saudi Arabia'),
(191, 'SN', 'Senegal'),
(192, 'RS', 'Serbia'),
(193, 'SC', 'Seychelles'),
(194, 'SL', 'Sierra Leone'),
(195, 'SG', 'Singapore'),
(196, 'SK', 'Slovakia'),
(197, 'SI', 'Slovenia'),
(198, 'SB', 'Solomon Islands'),
(199, 'SO', 'Somalia'),
(200, 'ZA', 'South Africa'),
(201, 'GS', 'South Georgia South Sandwich Islands'),
(202, 'ES', 'Spain'),
(203, 'LK', 'Sri Lanka'),
(204, 'SH', 'St. Helena'),
(205, 'PM', 'St. Pierre and Miquelon'),
(206, 'SD', 'Sudan'),
(207, 'SR', 'Suriname'),
(208, 'SJ', 'Svalbard and Jan Mayen Islands'),
(209, 'SZ', 'Swaziland'),
(210, 'SE', 'Sweden'),
(211, 'CH', 'Switzerland'),
(212, 'SY', 'Syrian Arab Republic'),
(213, 'TW', 'Taiwan'),
(214, 'TJ', 'Tajikistan'),
(215, 'TZ', 'Tanzania, United Republic of'),
(216, 'TH', 'Thailand'),
(217, 'TG', 'Togo'),
(218, 'TK', 'Tokelau'),
(219, 'TO', 'Tonga'),
(220, 'TT', 'Trinidad and Tobago'),
(221, 'TN', 'Tunisia'),
(222, 'TR', 'Turkey'),
(223, 'TM', 'Turkmenistan'),
(224, 'TC', 'Turks and Caicos Islands'),
(225, 'TV', 'Tuvalu'),
(226, 'UG', 'Uganda'),
(227, 'UA', 'Ukraine'),
(228, 'AE', 'United Arab Emirates'),
(229, 'GB', 'United Kingdom'),
(230, 'US', 'United States'),
(231, 'UM', 'United States minor outlying islands'),
(232, 'UY', 'Uruguay'),
(233, 'UZ', 'Uzbekistan'),
(234, 'VU', 'Vanuatu'),
(235, 'VA', 'Vatican City State'),
(236, 'VE', 'Venezuela'),
(237, 'VN', 'Vietnam'),
(238, 'VG', 'Virgin Islands (British)'),
(239, 'VI', 'Virgin Islands (U.S.)'),
(240, 'WF', 'Wallis and Futuna Islands'),
(241, 'EH', 'Western Sahara'),
(242, 'YE', 'Yemen'),
(243, 'ZR', 'Zaire'),
(244, 'ZM', 'Zambia'),
(245, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `customers`
--

INSERT INTO `customers` (`idData`, `name`, `address`, `city`, `country`, `zipCode`, `phone`, `email`, `userId`, `company`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(1, 'Demo Customer', 'demo', 'Bandung', 'ID', '52313', '085794867714', 'demo@tulisan.com', 4, 'Tulisan', 'SESSION_TEST', '2017-10-23 21:32:06', 'SESSION_TEST', '2017-10-23 21:40:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `departments`
--

CREATE TABLE `departments` (
  `idData` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `departments`
--

INSERT INTO `departments` (`idData`, `name`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(1, 'System', 'SESSION_TEST', '2017-10-23 14:50:26', NULL, NULL),
(4, 'Product', 'SESSION_TEST', '2017-10-23 14:50:26', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `feedback`
--

CREATE TABLE `feedback` (
  `idData` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `idData` int(11) NOT NULL,
  `customerId` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` text NOT NULL,
  `city` varchar(100) NOT NULL,
  `zipCode` varchar(10) NOT NULL,
  `country` varchar(100) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `email` varchar(100) NOT NULL,
  `total` int(11) NOT NULL,
  `paymentMethod` varchar(100) DEFAULT NULL,
  `bank` varchar(100) NOT NULL,
  `transferPicture` varchar(100) DEFAULT NULL,
  `dokuStatus` varchar(100) NOT NULL,
  `dokuMessage` text,
  `shippingMethod` varchar(100) DEFAULT NULL,
  `receiptNumber` text,
  `status` varchar(20) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`idData`, `customerId`, `name`, `address`, `city`, `zipCode`, `country`, `phone`, `email`, `total`, `paymentMethod`, `bank`, `transferPicture`, `dokuStatus`, `dokuMessage`, `shippingMethod`, `receiptNumber`, `status`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(1, 0, 'Demo Customer 1', 'Jl.Samosir Timur IV No.237 Bojongbata', 'Pemalang', '52319', 'ID', '085794867714', 'mereceiver7logia@gmail.com', 230000, 'BANK TRANSFER', 'MANDIRI', NULL, '', NULL, NULL, NULL, 'Waiting for payment', 'guest', '2017-12-03 22:39:49', NULL, NULL),
(2, 1, 'Demo Customer', 'Demo', 'Bandung', '52313', 'ID', '085794867714', 'megan@gmail.com', 100000, 'BANK TRANSFER', 'MANDIRI', NULL, '', NULL, NULL, NULL, 'Waiting for payment', 'demo@tulisan.com', '2017-12-03 22:50:14', NULL, NULL),
(3, 1, 'Demo Customer', 'demo', 'Bandung', '52313', 'ID', '085794867714', 'demo@tulisan.com', 100000, 'BANK TRANSFER', 'MANDIRI', NULL, '', NULL, NULL, NULL, 'Waiting for payment', 'demo@tulisan.com', '2017-12-03 10:28:56', NULL, NULL),
(4, 1, 'Demo Customer', 'demo', 'Bandung', '52313', 'ID', '085794867714', 'demo@tulisan.com', 100000, 'DOKU WALLET', '', NULL, '', NULL, NULL, NULL, 'Waiting for payment', 'demo@tulisan.com', '2017-12-04 19:19:12', NULL, NULL),
(5, 1, 'Demo Customer', 'demo', 'Bandung', '52313', 'ID', '085794867714', 'demo@tulisan.com', 200000, 'BANK TRANSFER', 'MANDIRI', NULL, '', NULL, NULL, NULL, 'Waiting for payment', 'demo@tulisan.com', '2017-12-04 19:20:27', NULL, NULL),
(6, 1, 'Demo Customer', 'demo', 'Bandung', '52313', 'ID', '085794867714', 'demo@tulisan.com', 1536000, 'BANK TRANSFER', 'MANDIRI', NULL, '', NULL, NULL, NULL, 'Waiting for payment', 'demo@tulisan.com', '2017-12-05 23:33:17', NULL, NULL),
(7, 1, 'Demo Customer', 'demo', 'Bandung', '52313', 'ID', '085794867714', 'demo@tulisan.com', 1836000, 'BANK TRANSFER', 'MANDIRI', NULL, '', NULL, NULL, NULL, 'Waiting for payment', 'demo@tulisan.com', '2017-12-05 23:34:17', NULL, NULL),
(8, 1, 'Demo Customer', 'demo', 'Bandung', '52313', 'ID', '085794867714', 'demo@tulisan.com', 918000, 'DOKU WALLET', '', NULL, '', NULL, NULL, NULL, 'Waiting for payment', 'demo@tulisan.com', '2017-12-05 23:34:34', NULL, NULL),
(9, 1, 'Demo Customer', 'demo', 'Bandung', '52313', 'ID', '085794867714', 'demo@tulisan.com', 918000, 'BANK TRANSFER', 'MANDIRI', NULL, '', NULL, NULL, NULL, 'Waiting for payment', 'demo@tulisan.com', '2017-12-07 01:56:25', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders_item`
--

CREATE TABLE `orders_item` (
  `idData` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `variantId` int(11) NOT NULL,
  `price` varchar(15) NOT NULL,
  `qty` int(11) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `orders_item`
--

INSERT INTO `orders_item` (`idData`, `orderId`, `variantId`, `price`, `qty`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(1, 1, 1, '100000', 2, 'guest', '2017-12-03 22:39:49', NULL, NULL),
(2, 1, 4, '30000', 1, 'guest', '2017-12-03 22:39:49', NULL, NULL),
(3, 2, 1, '100000', 1, 'demo@tulisan.com', '2017-12-03 22:50:14', NULL, NULL),
(4, 3, 1, '100000', 1, 'demo@tulisan.com', '2017-12-03 10:28:56', NULL, NULL),
(5, 4, 1, '100000', 1, 'demo@tulisan.com', '2017-12-04 19:19:12', NULL, NULL),
(6, 5, 1, '100000', 2, 'demo@tulisan.com', '2017-12-04 19:20:27', NULL, NULL),
(7, 6, 9, '918000', 1, 'demo@tulisan.com', '2017-12-05 23:33:17', NULL, NULL),
(8, 6, 1, '618000', 1, 'demo@tulisan.com', '2017-12-05 23:33:17', NULL, NULL),
(9, 7, 4, '918000', 1, 'demo@tulisan.com', '2017-12-05 23:34:17', NULL, NULL),
(10, 7, 9, '918000', 1, 'demo@tulisan.com', '2017-12-05 23:34:17', NULL, NULL),
(11, 8, 9, '918000', 1, 'demo@tulisan.com', '2017-12-05 23:34:34', NULL, NULL),
(12, 9, 4, '918000', 1, 'demo@tulisan.com', '2017-12-07 01:56:25', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `idData` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `sku` varchar(10) NOT NULL,
  `description` text NOT NULL,
  `material` text NOT NULL,
  `dimension` varchar(100) NOT NULL,
  `price` varchar(15) NOT NULL,
  `storyId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `lookBook1` varchar(100) DEFAULT NULL,
  `lookBook2` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '[0,''dsiabled''],[1,''active'']',
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`idData`, `name`, `sku`, `description`, `material`, `dimension`, `price`, `storyId`, `categoryId`, `lookBook1`, `lookBook2`, `status`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(87, 'Chemist Bag', 'BCH1705', '', 'Water-resistant PU coated cotton canvas. Comes with dust bag.', '36 x 16.5 x 26 cm | 14 x 6.5 x 10.25 in', '1,298,000', 5, 0, 'products_87_7.jpg', 'products_87_8.jpg', 0, 'admin@tulisan.com', '2017-12-05 01:13:05', '', '2017-12-19 03:30:57'),
(91, 'Pepe Doll', 'DPE1105', '', 'Cotton canvas', '4.3 x 11.7 cm (body only)', '98,000', 3, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-07 01:25:25', 'aryaputra@tulisan.com', '2017-12-19 23:39:08'),
(96, 'Mungil Bag', 'BMU1705', '\r\n', 'Water-resistant PU coated cotton canvas. comes with sling and dust bag', '25.5 x 10 x 23 cm | 10 x 4 x 9 in', '848,000', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-08 04:05:40', 'aryaputra@tulisan.com', '2017-12-19 23:00:58'),
(100, 'Chemist Bag', 'BCH1706', '', 'Water-resistant PU coated cotton canvas. Comes with dust bag.\r\n', '36 x 16.5 x 26 cm | 14 x 6.5 x 10.25 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 07:57:33', '', '2017-12-19 03:31:57'),
(101, 'Chemist Bag', 'BCH1707', '', 'Water-resistant PU coated cotton canvas. Comes with dust bag.', '36 x 16.5 x 26 cm | 14 x 6.5 x 10.25 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 07:58:19', '', '2017-12-19 03:32:49'),
(102, 'Chemist Bag', 'BCH1708', '', 'Water-resistant PU coated cotton canvas. Comes with dust bag.', '36 x 16.5 x 26 cm | 14 x 6.5 x 10.25 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 07:58:58', 'admin@tulisan.com', '2017-12-14 09:31:37'),
(103, 'Metropole Bag', 'BME1706', '', 'Water-resistant PU coated cotton canvas. Features 2 side pockets. Comes with sling and dust bag.', '42 x 11.5 x 33 cm | 16.5 x 4.5 x 13 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 08:00:43', 'admin@tulisan.com', '2017-12-14 09:37:32'),
(104, 'Mochila Bag', 'BMO1708', '', 'Water-resistant PU coated cotton canvas. features 1 zippered exterior compartment 2 side pockets and mesh interior pocket. comes with pouch and dust bag.\r\n', '33 x 14 x 44.5 cm | 13 x 5.5 x 17.5 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 08:02:16', 'aryaputra@tulisan.com', '2017-12-19 22:57:41'),
(105, 'Mochila Bag', 'BMO1706', '', 'Water-resistant PU coated cotton canvas. features 1 zippered exterior compartment 2 side pockets and mesh interior pocket. comes with pouch and dust bag.\r\n', '33 x 14 x 44.5 cm | 13 x 5.5 x 17.5 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 08:04:14', 'aryaputra@tulisan.com', '2017-12-19 22:58:47'),
(106, 'Mungil Bag', 'BMU1706', '', 'Water-resistant PU coated cotton canvas. comes with sling and dust bag.', '25.5 x 10 x 23 cm | 10 x 4 x 9 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 08:05:27', 'aryaputra@tulisan.com', '2017-12-19 23:01:57'),
(107, 'Mungil Bag', 'BMU1707', '', 'Water-resistant PU coated cotton canvas. comes with sling and dust bag.', '25.5 x 10 x 23 cm | 10 x 4 x 9 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 08:06:13', 'aryaputra@tulisan.com', '2017-12-19 23:02:43'),
(108, 'Mungil Bag', 'BMU1708', '', 'Water-resistant PU coated cotton canvas. comes with sling and dust bag.', '25.5 x 10 x 23 cm | 10 x 4 x 9 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 08:07:12', 'aryaputra@tulisan.com', '2017-12-19 23:04:50'),
(109, 'Sailing Bag', 'BSL1623', '', 'Water-resistant PU coated cotton canvas. Features 1 exterior pocket  3 interior pockets and 1 hanging pocket. Comes with matching pouch and dust bag.', '32 x 16 x 40 cm | 12.5 x 6.25 x 15.75 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 08:08:39', '', '2017-12-20 01:36:44'),
(110, 'Sailing Bag', 'BSL1622', '', 'Water-resistant PU coated cotton canvas. Features 1 exterior pocket  3 interior pockets and 1 hanging pocket. Comes with matching pouch and dust bag.\r\nDimensions', '32 x 16 x 40 cm | 12.5 x 6.25 x 15.75 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 08:09:25', '', '2017-12-20 01:38:44'),
(111, 'Skipper Bag', 'BSK1623', '', 'Water-resistant PU coated cotton canvas with genuine leather handle. Features 1 exterior zipped pocket and interior hanging pocket. Comes with matching pouch and dust bag.\r\n', '31 x 10 x 42cm | 12.25 x 4 x 16.5 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 08:10:34', '', '2017-12-20 01:40:06'),
(112, 'Skipper Bag', 'BSK1622', '', 'Water-resistant PU coated cotton canvas with genuine leather handle. Features 1 exterior zipped pocket and interior hanging pocket. Comes with matching pouch and dust bag.', '31 x 10 x 42cm | 12.25 x 4 x 16.5 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 08:11:06', '', '2017-12-20 01:41:14'),
(113, 'Weekend Bag', 'BWE1603', '', 'Water-resistant PU coated cotton canvas. Comes with matching pouch and dust bag.', '36 x 20 x 39.5 cm | 14 x 7.75 x 15.5 in', '', 11, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 08:13:28', '', '2017-12-20 02:07:57'),
(114, 'Weekend Bag', 'BWE1604', '', 'Water-resistant PU coated cotton canvas. Comes with matching pouch and dust bag.', '36 x 20 x 39.5 cm | 14 x 7.75 x 15.5 in', '', 11, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 08:14:20', '', '2017-12-20 02:09:28'),
(115, 'Weekend Bag', 'BWE1605', '', 'Water-resistant PU coated cotton canvas. Comes with matching pouch and dust bag.', '36 x 20 x 39.5 cm | 14 x 7.75 x 15.5 in', '', 11, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 08:16:53', '', '2017-12-20 02:12:29'),
(116, 'Weekend Bag', 'BWE1606', '', 'Water-resistant PU coated cotton canvas. Comes with matching pouch and dust bag.', '36 x 20 x 39.5 cm | 14 x 7.75 x 15.5 in', '', 11, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 08:17:48', '', '2017-12-20 02:13:41'),
(117, 'Weekend Bag', 'BWE1626', '', 'Water-resistant PU coated cotton canvas. Comes with matching pouch and dust bag.', '36 x 20 x 39.5 cm | 14 x 7.75 x 15.5 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 08:19:11', '', '2017-12-20 02:17:40'),
(119, 'Pouches', 'POU1624', '', 'Water-resistant PU coated cotton canvas.', '36 x 26.5 cm | 14.25 x 10.5 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 08:25:02', '', '2017-12-20 01:10:21'),
(121, 'Pouches', 'POU1625', '', 'Water-resistant PU coated cotton canvas.', '36 x 26.5 cm | 14.25 x 10.5 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 08:42:55', '', '2017-12-20 01:13:12'),
(122, 'Pouches', 'POU1626', '', 'Water-resistant PU coated cotton canvas.', '36 x 26.5 cm | 14.25 x 10.5 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 08:44:16', '', '2017-12-20 01:15:29'),
(123, 'Pouches', 'POU1627', '', 'Water-resistant PU coated cotton canvas.\r\n', '36 x 26.5 cm | 14.25 x 10.5 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 08:45:13', '', '2017-12-20 01:17:19'),
(124, 'Pouches', 'POU1705', '', 'Water-resistant PU coated cotton canvas.', '36 x 26.5 cm | 14.25 x 10.5 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 08:48:44', '', '2017-12-20 01:25:34'),
(125, 'Pouches', 'POU1706', '', 'Water-resistant PU coated cotton canvas.', '36 x 26.5 cm | 14.25 x 10.5 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 08:49:40', '', '2017-12-20 01:27:14'),
(126, 'Pouches', 'POU1707', '', 'Water-resistant PU coated cotton canvas.\r\n', '36 x 26.5 cm | 14.25 x 10.5 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 08:50:40', 'admin@tulisan.com', '2017-12-14 09:36:52'),
(127, 'Pouches', 'POU1708', '', 'Water-resistant PU coated cotton canvas.\r\n', '36 x 26.5 cm | 14.25 x 10.5 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 08:51:33', 'admin@tulisan.com', '2017-12-14 09:37:09'),
(128, 'Organizer', 'ORG1624', '', 'Water-resistant PU coated cotton canvas.', '25 x 10 x 21.5 cm | 10 x 4 x 8.5 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 08:57:59', 'aryaputra@tulisan.com', '2017-12-19 23:11:18'),
(129, 'Organizer', 'ORG1625', '', 'Water-resistant PU coated cotton canvas.', '25 x 10 x 21.5 cm | 10 x 4 x 8.5 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 08:59:25', 'aryaputra@tulisan.com', '2017-12-19 23:13:40'),
(130, 'Organizer', 'ORG1626', '', 'Water-resistant PU coated cotton canvas.\r\n', '25 x 10 x 21.5 cm | 10 x 4 x 8.5 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 09:00:30', 'aryaputra@tulisan.com', '2017-12-19 23:15:58'),
(131, 'Organizer', 'ORG1627', '', 'Water-resistant PU coated cotton canvas.', '25 x 10 x 21.5 cm | 10 x 4 x 8.5 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 09:01:36', 'aryaputra@tulisan.com', '2017-12-19 23:17:51'),
(132, 'Organizer', 'ORG1705', '', 'Water-resistant PU coated cotton canvas.\r\n', '25 x 10 x 21.5 cm | 10 x 4 x 8.5 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 09:03:15', 'aryaputra@tulisan.com', '2017-12-19 23:20:26'),
(133, 'Organizer', 'ORG1706', '', 'Water-resistant PU coated cotton canvas.', '25 x 10 x 21.5 cm | 10 x 4 x 8.5 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 09:04:25', 'aryaputra@tulisan.com', '2017-12-19 23:22:24'),
(134, 'Organizer', 'ORG1707', '', 'Water-resistant PU coated cotton canvas.\r\n', '25 x 10 x 21.5 cm | 10 x 4 x 8.5 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 09:05:17', 'aryaputra@tulisan.com', '2017-12-19 23:24:00'),
(135, 'Organizer', 'ORG1708', '', 'Water-resistant PU coated cotton canvas.\r\n', '25 x 10 x 21.5 cm | 10 x 4 x 8.5 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 09:05:20', 'aryaputra@tulisan.com', '2017-12-19 23:28:42'),
(136, 'Cubes', 'CUB1624', '', 'Water-resistant PU coated cotton canvas.', '25 x 13.5 x 13.5 cm | 10 x 5.5 x 5.5 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:07:10', '', '2017-12-19 03:51:51'),
(137, 'Cubes', 'CUB1625', '', 'Water-resistant PU coated cotton canvas.', '25 x 13.5 x 13.5 cm | 10 x 5.5 x 5.5 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:08:11', '', '2017-12-19 03:50:11'),
(138, 'Cubes', 'CUB1626', '', 'Water-resistant, PU coated cotton canvas.', '25 x 13.5 x 13.5 cm | 10 x 5.5 x 5.5 in', '', 0, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:08:55', NULL, NULL),
(139, 'Cubes', 'CUB1627', '', 'Water-resistant PU coated cotton canvas.\r\n', '25 x 13.5 x 13.5 cm | 10 x 5.5 x 5.5 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:09:39', '', '2017-12-19 03:53:48'),
(140, 'Cubes', 'CUB1705', '', 'Water-resistant PU coated cotton canvas.\r\n', '25 x 13.5 x 13.5 cm | 10 x 5.5 x 5.5 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:10:42', '', '2017-12-19 03:55:12'),
(141, 'Cubes', 'CUB1706', '', 'Water-resistant PU coated cotton canvas.', '25 x 13.5 x 13.5 cm | 10 x 5.5 x 5.5 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:11:21', '', '2017-12-19 04:00:21'),
(142, 'Cubes', 'CUB1707', '', 'Water-resistant PU coated cotton canvas.', '25 x 13.5 x 13.5 cm | 10 x 5.5 x 5.5 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:12:06', '', '2017-12-19 04:02:29'),
(143, 'Cubes', 'CUB1708', '', 'Water-resistant PU coated cotton canvas.', '25 x 13.5 x 13.5 cm | 10 x 5.5 x 5.5 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:12:37', '', '2017-12-19 04:05:10'),
(144, 'Olio Clutch', 'COL1626', '', 'Water-resistant PU coated cotton canvas. Features 12 card compartments 1 zipped pocket 4 bill compartments and comes with dust bag.', '21 x 12 cm | 8.25 x 4.75 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:15:58', 'aryaputra@tulisan.com', '2017-12-19 23:08:02'),
(145, 'Olio Clutch', 'COL1706', '', 'Water-resistant PU coated cotton canvas. Features 12 card compartments 1 zipped pocket 4 bill compartments and comes with dust bag.', '21 x 12 cm | 8.25 x 4.75 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:17:35', 'aryaputra@tulisan.com', '2017-12-19 23:09:07'),
(146, 'Olio Clutch', 'COL1707', '', 'Water-resistant PU coated cotton canvas. Features 12 card compartments 1 zipped pocket 4 bill compartments and comes with dust bag.', '21 x 12 cm | 8.25 x 4.75 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:18:15', 'aryaputra@tulisan.com', '2017-12-19 23:09:50'),
(147, 'Olio Clutch', 'COL1708', '', 'Water-resistant, PU coated cotton canvas. Features 12 card compartments, 1 zipped pocket, 4 bill compartments, and comes with dust bag.', '21 x 12 cm | 8.25 x 4.75 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:18:45', NULL, NULL),
(148, 'Card Holder ', 'CHO1706', '', 'Water-resistant PU coated cotton canvas.', '11 x 7 cm | 4.25 x 2.75 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:20:17', '', '2017-12-19 03:28:15'),
(149, 'Card Holder ', 'CHO1707', '', 'Water-resistant PU coated cotton canvas.\r\n', '11 x 7 cm | 4.25 x 2.75 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:20:48', 'aryaputra@tulisan.com', '2017-12-18 01:10:59'),
(150, 'Card Holder ', 'CHO1708', '', 'Water-resistant, PU coated cotton canvas.\r\n', '11 x 7 cm | 4.25 x 2.75 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:21:17', NULL, NULL),
(151, 'Passport Envelope', 'EPS1625', '', 'Water-resistant PU coated cotton canvas.\r\n', '14 x 9.5 cm | 5.5 x 3.75 in (Folded) 14x19cm | 5.5x7.5in(Unfolded)', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:22:37', 'aryaputra@tulisan.com', '2017-12-19 23:31:04'),
(152, 'Passport Envelope', 'EPS1626', '', 'Water-resistant PU coated cotton canvas.\r\n', '14 x 9.5 cm | 5.5 x 3.75 in (Folded) 14x19cm | 5.5x7.5in(Unfolded)', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:24:37', 'aryaputra@tulisan.com', '2017-12-19 23:34:17'),
(153, 'Passport Envelope', 'EPS1627', '', 'Water-resistant PU coated cotton canvas.\r\n', '14 x 9.5 cm | 5.5 x 3.75 in (Folded) 14x19cm | 5.5x7.5in(Unfolded)', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:26:14', 'aryaputra@tulisan.com', '2017-12-19 23:35:08'),
(154, 'Passport Envelope', 'EPS1706', '', 'Water-resistant PU coated cotton canvas.', '14 x 9.5 cm | 5.5 x 3.75 in (Folded) 14x19cm | 5.5x7.5in(Unfolded)', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:27:15', 'aryaputra@tulisan.com', '2017-12-19 23:35:55'),
(155, 'Passport Envelope', 'EPS1707', '', 'Water-resistant PU coated cotton canvas.\r\n', '14 x 9.5 cm | 5.5 x 3.75 in (Folded) 14x19cm | 5.5x7.5in(Unfolded)', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:27:43', 'aryaputra@tulisan.com', '2017-12-19 23:36:41'),
(156, 'Passport Envelope', 'EPS1708', '', 'Water-resistant, PU coated cotton canvas.\r\n', '14 x 9.5 cm | 5.5 x 3.75 in (Folded) 14x19cm | 5.5x7.5in(Unfolded)', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:28:05', NULL, NULL),
(157, 'Luncheon Napkin', 'HNL1603', '', 'Non-bleached cotton canvas (non-coated). set of four napkins.', '40 x 40 cm | 15.75 x 15.75 in', '', 11, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:30:46', '', '2017-12-19 04:49:21'),
(158, 'Luncheon Napkin', 'HNL1604', '', 'Non-bleached cotton canvas (non-coated). set of four napkins.', '40 x 40 cm | 15.75 x 15.75 in', '', 11, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:31:11', 'aryaputra@tulisan.com', '2017-12-19 22:26:03'),
(159, 'Luncheon Napkin', 'HNL1605', '', 'Non-bleached cotton canvas (non-coated). set of four napkins.', '40 x 40 cm | 15.75 x 15.75 in', '', 11, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:31:37', 'aryaputra@tulisan.com', '2017-12-19 22:27:48'),
(160, 'Luncheon Napkin', 'HNL1606', '', 'Non-bleached cotton canvas (non-coated). set of four napkins.', '40 x 40 cm | 15.75 x 15.75 in', '', 11, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:31:52', 'aryaputra@tulisan.com', '2017-12-19 22:29:17'),
(161, 'Luncheon Napkin', 'HNL1624', '', 'Non-bleached cotton canvas (non-coated). set of four napkins.', '40 x 40 cm | 15.75 x 15.75 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:32:26', 'aryaputra@tulisan.com', '2017-12-19 22:30:31'),
(162, 'Luncheon Napkin', 'HNL1625', '', 'Non-bleached cotton canvas (non-coated). set of four napkins.', '40 x 40 cm | 15.75 x 15.75 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:32:46', 'aryaputra@tulisan.com', '2017-12-19 22:32:05'),
(163, 'Luncheon Napkin', 'HNL1626', '', 'Non-bleached cotton canvas (non-coated). set of four napkins.', '40 x 40 cm | 15.75 x 15.75 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:33:09', 'aryaputra@tulisan.com', '2017-12-19 22:33:38'),
(164, 'Luncheon Napkin', 'HNL1627', '', 'Non-bleached cotton canvas (non-coated). set of four napkins.', '40 x 40 cm | 15.75 x 15.75 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:33:31', 'aryaputra@tulisan.com', '2017-12-19 22:34:51'),
(165, 'Luncheon Napkin', 'HNL1705', '', 'Non-bleached cotton canvas (non-coated). set of four napkins.', '40 x 40 cm | 15.75 x 15.75 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:33:52', 'aryaputra@tulisan.com', '2017-12-19 22:37:22'),
(166, 'Luncheon Napkin', 'HNL1706', '', 'Non-bleached cotton canvas (non-coated). set of four napkins.', '40 x 40 cm | 15.75 x 15.75 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:34:50', 'aryaputra@tulisan.com', '2017-12-19 22:39:16'),
(167, 'Luncheon Napkin', 'HNL1707', '', 'Non-bleached cotton canvas (non-coated). set of four napkins.', '40 x 40 cm | 15.75 x 15.75 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:35:49', 'aryaputra@tulisan.com', '2017-12-19 22:40:31'),
(168, 'Luncheon Napkin', 'HNL1708', '', 'Non-bleached cotton canvas (non-coated). set of four napkins.', '40 x 40 cm | 15.75 x 15.75 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:36:10', 'aryaputra@tulisan.com', '2017-12-19 22:41:16'),
(169, 'Studio Apron', 'HSA1603', '', 'Non-bleached cotton canvas (non-coated).', '34 x 77 cm | 13.5 x 30.5 in', '', 11, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:40:53', '', '2017-12-20 01:43:57'),
(170, 'Studio Apron', 'HSA1604', '', 'Non-bleached cotton canvas (non-coated).', '34 x 77 cm | 13.5 x 30.5 in', '', 11, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:41:24', '', '2017-12-20 01:44:54'),
(171, 'Studio Apron', 'HSA1605', '', 'Non-bleached cotton canvas (non-coated).', '34 x 77 cm | 13.5 x 30.5 in', '', 11, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:41:36', '', '2017-12-20 01:45:50'),
(172, 'Studio Apron', 'HSA1606', '', 'Non-bleached cotton canvas (non-coated).', '34 x 77 cm | 13.5 x 30.5 in', '', 11, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:41:48', '', '2017-12-20 01:47:03'),
(173, 'Studio Apron', 'HSA1624', '', 'Non-bleached cotton canvas (non-coated).', '34 x 77 cm | 13.5 x 30.5 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:42:05', '', '2017-12-20 01:47:58'),
(174, 'Studio Apron', 'HSA1625', '', 'Non-bleached cotton canvas (non-coated).', '34 x 77 cm | 13.5 x 30.5 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:42:16', '', '2017-12-20 01:48:55'),
(175, 'Studio Apron', 'HSA1626', '', 'Non-bleached cotton canvas (non-coated).', '34 x 77 cm | 13.5 x 30.5 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:42:29', '', '2017-12-20 01:49:46'),
(176, 'Studio Apron', 'HSA1627', '', 'Non-bleached cotton canvas (non-coated).', '34 x 77 cm | 13.5 x 30.5 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:42:42', '', '2017-12-20 01:50:41'),
(177, 'Studio Apron', 'HSA1705', '', 'Non-bleached cotton canvas (non-coated).', '34 x 77 cm | 13.5 x 30.5 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:43:15', '', '2017-12-20 01:51:06'),
(178, 'Studio Apron', 'HSA1706', '', 'Non-bleached cotton canvas (non-coated).', '34 x 77 cm | 13.5 x 30.5 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:43:37', '', '2017-12-20 01:51:43'),
(179, 'Studio Apron', 'HSA1707', '', 'Non-bleached cotton canvas (non-coated).', '34 x 77 cm | 13.5 x 30.5 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:44:01', '', '2017-12-20 01:52:14'),
(180, 'Studio Apron', 'HSA1708', '', 'Non-bleached cotton canvas (non-coated).', '34 x 77 cm | 13.5 x 30.5 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:44:23', '', '2017-12-20 01:52:36'),
(181, 'Car Organizer', 'HCO1603', '', 'Non-bleached cotton canvas (non-coated).', '29 x 39 cm | 11.5 x 15.5 in', '', 11, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:45:41', '', '2017-12-18 00:00:25'),
(182, 'Car Organizer', 'HCO1604', '', 'Non-bleached cotton canvas (non-coated).', '29 x 39 cm | 11.5 x 15.5 in', '', 11, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:46:10', '', '2017-12-18 00:01:06'),
(183, 'Car Organizer', 'HCO1605', '', 'Non-bleached cotton canvas (non-coated).', '29 x 39 cm | 11.5 x 15.5 in', '', 11, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:46:22', '', '2017-12-19 03:19:20'),
(184, 'Car Organizer', 'HCO1606', '', 'Non-bleached cotton canvas (non-coated).', '29 x 39 cm | 11.5 x 15.5 in', '', 11, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:46:57', '', '2017-12-19 03:20:13'),
(185, 'Car Organizer', 'HCO1624', '', 'Non-bleached cotton canvas (non-coated).', '29 x 39 cm | 11.5 x 15.5 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:47:22', '', '2017-12-18 00:03:38'),
(186, 'Car Organizer', 'HCO1625', '', 'Non-bleached cotton canvas (non-coated).', '29 x 39 cm | 11.5 x 15.5 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:47:33', '', '2017-12-19 03:21:29'),
(187, 'Car Organizer', 'HCO1626', '', 'Non-bleached cotton canvas (non-coated).', '29 x 39 cm | 11.5 x 15.5 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:47:41', '', '2017-12-19 03:52:18'),
(188, 'Car Organizer', 'HCO1627', '', 'Non-bleached cotton canvas (non-coated).', '29 x 39 cm | 11.5 x 15.5 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:47:55', 'aryaputra@tulisan.com', '2017-12-18 00:22:47'),
(189, 'Car Organizer', 'HCO1705', '', 'Non-bleached cotton canvas (non-coated).', '50 x 80 cm | 19.75 x 31.5 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:48:11', '', '2017-12-19 03:24:34'),
(190, 'Car Organizer', 'CHO1706', '', 'Non-bleached cotton canvas (non-coated).', '50 x 80 cm | 19.75 x 31.5 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:48:24', 'aryaputra@tulisan.com', '2017-12-18 00:25:00'),
(191, 'Car Organizer', 'HCO1707', '', 'Non-bleached cotton canvas (non-coated).', '50 x 80 cm | 19.75 x 31.5 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:48:45', 'aryaputra@tulisan.com', '2017-12-18 00:25:36'),
(192, 'Car Organizer', 'HCO1708', '', 'Non-bleached cotton canvas (non-coated).', '50 x 80 cm | 19.75 x 31.5 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:49:18', 'aryaputra@tulisan.com', '2017-12-18 00:27:02'),
(193, 'Twiggy Hat', 'ATW1603', '', '', '', '', 0, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:51:00', NULL, NULL),
(194, 'Twiggy Hat', 'ATW1604', '', '', '', '', 0, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:51:12', NULL, NULL),
(195, 'Twiggy Hat', 'ATW1605', '', '', '', '', 0, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:51:36', NULL, NULL),
(196, 'Twiggy Hat', 'ATW1606', '', '', '', '', 0, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:51:51', NULL, NULL),
(197, 'Twiggy Hat', 'ATW1707', '', '', '', '', 0, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:52:15', NULL, NULL),
(198, 'Beverage Coaster', 'HBC1624', '', 'Non-bleached cotton canvas (non-coated). set of four coasters.', '10 x 10 cm | 4 x 4 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:53:18', '', '2017-12-17 23:55:09'),
(199, 'Beverage Coaster', 'HBC1625', '', 'Non-bleached cotton canvas (non-coated). set of four coasters.', '10 x 10 cm | 4 x 4 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:53:32', '', '2017-12-17 23:56:01'),
(200, 'Beverage Coaster', 'HBC1626', '', 'Non-bleached cotton canvas (non-coated). set of four coasters.', '10 x 10 cm | 4 x 4 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:53:42', '', '2017-12-17 23:57:05'),
(201, 'Beverage Coaster', 'HBC1627', '', 'Non-bleached cotton canvas (non-coated). set of four coasters.', '10 x 10 cm | 4 x 4 in', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:53:50', '', '2017-12-17 23:57:48'),
(202, 'Beverage Coaster', 'HBC1706', '', 'Non-bleached cotton canvas (non-coated). set of four coasters.', '10 x 10 cm | 4 x 4 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:54:08', '', '2017-12-17 23:58:20'),
(203, 'Beverage Coaster', 'HBC1707', '', 'Non-bleached cotton canvas (non-coated). set of four coasters.', '10 x 10 cm | 4 x 4 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:54:22', '', '2017-12-17 23:58:45'),
(204, 'Beverage Coaster', 'HBC1708', '', 'Non-bleached cotton canvas (non-coated). set of four coasters.', '10 x 10 cm | 4 x 4 in', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:54:34', 'aryaputra@tulisan.com', '2017-12-18 00:16:50'),
(205, 'Post Card', 'PPO1407', 'ANIMA are Tulisan limited edition playing cards illustrated by Melissa Sunjaya and Sebastien Theraulaz. The four suits correspond to the four classical elements: Air (Hearts) Fire (Spades) Water (Clubs) and Earth (Diamonds). Additionally the deck features two jokers depicted by the artist\' Oracle of the Sacred Catfish and two special Anima cards portrayed by their Supreme Hippocampus. While ANIMA cards are perfect for playing traditional card games divination and storytelling they are also excellent for crafting whimsical gift tags secret notes or special reminders.', '', '', '', 10, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:55:46', 'aryaputra@tulisan.com', '2017-12-17 22:21:19'),
(206, 'Playing Card', 'PPC1407', 'ANIMA are Tulisan limited edition playing cards illustrated by Melissa Sunjaya and Sebastien Theraulaz. The four suits correspond to the four classical elements: Air (Hearts) Fire (Spades) Water (Clubs) and Earth (Diamonds). Additionally the deck features two jokers depicted by the artist\' Oracle of the Sacred Catfish and two special Anima cards portrayed by their Supreme Hippocampus. While ANIMA cards are perfect for playing traditional card games divination and storytelling they are also excellent for crafting whimsical gift tags secret notes or special reminders.\r\n', 'Coated card stock with matte laminating finish.\r\n', '5.5 cm x 9.5 cm', '', 10, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:56:41', '', '2017-12-20 01:07:33'),
(207, 'Bio Fantasy Books', 'BBF1628', '', '180 coloured pages, hard cover with stitched binding Finished with gold de-bossed title\r\n', '176 x 250 x 17 mm', '', 0, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:58:24', NULL, NULL),
(208, 'Surat 1', 'BSX1629', '', '', '', '', 9, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 10:59:23', 'aryaputra@tulisan.com', '2017-12-18 09:31:46'),
(209, 'Surat 2', 'BSX1723', '', '', '', '', 5, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 11:00:03', 'aryaputra@tulisan.com', '2017-12-18 09:32:32'),
(210, 'Daisy Loops', 'LDA06012', '', 'Water-resistant non-toxic coated cotton canvas', '9 cm (diameter)', '', 12, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 11:01:03', '', '2017-12-19 04:35:43'),
(211, 'Monograph Fiction', 'MFI1107-EN', '', '', '', '', 12, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 11:02:02', 'aryaputra@tulisan.com', '2017-12-19 23:00:38'),
(212, 'Batavia Hotel Gift Tag', 'GIF1104', 'A box of 20 cards and a roll of ribbon with 10 unique illustrated designs for personalized tags or gifts. Each tag has a 0.125 inch hole for tying the ribbon.\r\n', 'Uncoated card stock with matte laminating finish on one side.', '13.3 x 9.5 cm', '', 0, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 11:03:57', NULL, NULL),
(213, 'Delightfully Yours Gift Tag', 'GIF1101', 'A box of 20 cards and a roll of ribbon with 10 unique illustrated designs for personalized tags or gifts. Each tag has a 0.125 inch hole for tying the ribbon.\r\n', 'Uncoated card stock with matte laminating finish on one side.\r\n', '13.3 x 9.5 cm', '', 0, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 11:05:04', '', '2017-12-19 04:39:42'),
(214, 'Eyewear', 'AEW1607', '', '', '', '', 0, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 11:08:23', '', '2017-12-19 04:45:02'),
(215, 'Eyewear', 'AEW1608', '', '', '', '', 0, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 11:08:53', NULL, NULL),
(216, 'Eyewear', 'AEW1609', '', '', '', '', 0, 0, NULL, NULL, 0, 'admin@tulisan.com', '2017-12-14 11:09:07', NULL, NULL),
(217, 'Besame Mucho', 'PBE1605', '', 'Non-bleached cotton canvas (non-coated).', '12.5 x 21 cm | 5 x 8.25 in', '', 11, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 03:36:44', '', '2017-12-17 23:49:30'),
(218, 'Besame Mucho', 'PBE1626', '', 'Non-bleached cotton canvas (non-coated).', '12.5 x 21 cm | 5 x 8.25 in', '', 9, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 03:37:11', '', '2017-12-17 23:50:33'),
(219, 'Besame Mucho', 'PBE1705', '', 'Non-bleached cotton canvas (non-coated).', '12.5 x 21 cm | 5 x 8.25 in', '', 5, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 03:37:54', '', '2017-12-17 23:51:33'),
(220, 'Besame Mucho', 'PBE1706', '', 'Non-bleached cotton canvas (non-coated).', '12.5 x 21 cm | 5 x 8.25 in', '', 5, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 03:38:04', '', '2017-12-17 23:52:17'),
(221, 'Besame Mucho', 'PBE1707', '', 'Non-bleached cotton canvas (non-coated).', '12.5 x 21 cm | 5 x 8.25 in', '', 5, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 03:38:20', '', '2017-12-17 23:52:58'),
(222, 'Besame Mucho', 'PBE1708', '', 'Non-bleached cotton canvas (non-coated).', '12.5 x 21 cm | 5 x 8.25 in', '', 5, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 03:40:21', '', '2017-12-17 23:54:09'),
(223, 'Apron Kangaroo', 'HAK1626', '', 'Non-bleached cotton canvas (non-coated).', '73 x 80 cm | 28.75 x 31.5 in', '', 9, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 03:42:14', '', '2017-12-17 23:44:03'),
(224, 'Apron Kangaroo', 'HAK1627', '', 'Non-bleached cotton canvas (non-coated).', '73 x 80 cm | 28.75 x 31.5 in', '', 9, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 03:44:45', '', '2017-12-17 23:43:50'),
(225, 'Apron Kangaroo', 'HAK1706', '', 'Non-bleached cotton canvas (non-coated).', '73 x 80 cm | 28.75 x 31.5 in', '', 5, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 03:45:27', '', '2017-12-17 23:45:38'),
(226, 'Apron Kangaroo', 'HAK1707', '', 'Non-bleached cotton canvas (non-coated).', '73 x 80 cm | 28.75 x 31.5 in', '', 5, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 03:45:48', '', '2017-12-17 23:46:27'),
(227, 'Apron Kangaroo', 'HAK1708', '', 'Non-bleached cotton canvas (non-coated).', '73 x 80 cm | 28.75 x 31.5 in', '', 5, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 03:46:07', '', '2017-12-17 23:47:27'),
(228, 'Cooking Apron', 'HAP1622', '', 'Non-bleached cotton canvas (non-coated)\r\n', '73 x 81 cm | 28.75 x 32 in', '', 9, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 03:49:09', '', '2017-12-19 03:34:16'),
(229, 'Cooking Apron', 'HAP1623', '', 'Non-bleached cotton canvas (non-coated)\r\n', '73 x 81 cm | 28.75 x 32 in', '', 0, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 03:51:13', NULL, NULL),
(230, 'Cooking Apron', 'HAP1701', 'Another signature product from Tulisan\'s founding team is this multi-purpose apron. Whether you cook for pleasure or for profession, the apron wraps to your aid. Also a great addition when working with painting or any craft project.\r\n', 'Non-bleached cotton canvas (non-coated)\r\n', '73 x 81 cm | 28.75 x 32 in', '', 5, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 03:52:16', NULL, NULL),
(231, 'Cooking Apron', 'HAP1702', 'Another signature product from Tulisan\'s founding team is this multi-purpose apron. Whether you cook for pleasure or for profession the apron wraps to your aid. Also a great addition when working with painting or any craft project.\r\n', 'Non-bleached cotton canvas (non-coated)\r\n', '73 x 81 cm | 28.75 x 32 in', '', 5, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 03:53:45', '', '2017-12-19 03:37:30'),
(232, 'Cooking Apron', 'HAP1703', 'Another signature product from Tulisan\'s founding team is this multi-purpose apron. Whether you cook for pleasure or for profession, the apron wraps to your aid. Also a great addition when working with painting or any craft project.\r\n', 'Non-bleached cotton canvas (non-coated)\r\n', '73 x 81 cm | 28.75 x 32 in', '', 5, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 03:54:28', NULL, NULL),
(233, 'Cooking Apron', 'HAP1704', 'Another signature product from Tulisan\'s founding team is this multi-purpose apron. Whether you cook for pleasure or for profession, the apron wraps to your aid. Also a great addition when working with painting or any craft project.\r\n', 'Non-bleached cotton canvas (non-coated)\r\n', '73 x 81 cm | 28.75 x 32 in', '', 5, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 03:55:17', NULL, NULL),
(234, 'Cushion Cover', 'HCC1603', '', 'Non-bleached cotton canvas (non-coated).', '49 x 49 cm | 19.25 x 19.25 in', '', 11, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 03:58:59', 'aryaputra@tulisan.com', '2017-12-18 01:18:10'),
(235, 'Cushion Cover', 'HCC1604', '', 'Non-bleached cotton canvas (non-coated).', '49 x 49 cm | 19.25 x 19.25 in', '', 11, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:00:28', 'aryaputra@tulisan.com', '2017-12-18 01:19:29'),
(236, 'Cushion Cover', 'HCC1605', '', 'Non-bleached cotton canvas (non-coated).', '49 x 49 cm | 19.25 x 19.25 in', '', 0, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:00:59', '', '2017-12-19 04:12:13'),
(237, 'Cushion Cover', 'HCC1606', '', 'Non-bleached cotton canvas (non-coated).', '49 x 49 cm | 19.25 x 19.25 in', '', 11, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:01:08', '', '2017-12-19 04:11:18'),
(238, 'Cushion Cover', 'HCC1622', '', 'Non-bleached cotton canvas (non-coated).', '48 x 48 cm | 19 x 19 in', '', 9, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:02:06', '', '2017-12-19 04:15:41'),
(239, 'Cushion Cover', 'HCC1623', '', 'Non-bleached cotton canvas (non-coated).', '48 x 48 cm | 19 x 19 in', '', 9, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:02:19', '', '2017-12-19 04:15:23'),
(240, 'Cushion Cover', 'HCC1626', '', 'non-bleached cotton canvas (non-coated).', '49 x 49 cm | 19.25 x 19.25 in', '', 9, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:02:45', '', '2017-12-19 04:17:09'),
(241, 'Cushion Cover', 'HCC1627', '', 'Non-bleached cotton canvas (non-coated).', '49 x 49 cm | 19.25 x 19.25 in', '', 9, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:02:55', '', '2017-12-19 04:18:39'),
(242, 'Cushion Cover', 'HCC1701', 'A two sided cover for your sofa bed or decorative needs.\r\n', 'Non-bleached cotton canvas (non-coated)\r\n', '48 x 48 cm | 19 x 19 in', '', 5, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:04:00', '', '2017-12-19 04:19:34'),
(243, 'Cushion Cover', 'HCC1702', 'A two sided cover for your sofa bed or decorative needs.\r\n', 'Non-bleached cotton canvas (non-coated)\r\n', '48 x 48 cm | 19 x 19 in', '', 5, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:04:31', '', '2017-12-19 04:20:28'),
(244, 'Cushion Cover', 'HCC1703', 'A two sided cover for your sofa bed or decorative needs.\r\n', 'Non-bleached cotton canvas (non-coated)\r\n', '48 x 48 cm | 19 x 19 in', '', 5, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:05:07', '', '2017-12-19 04:21:20'),
(245, 'Cushion Cover', 'HCC1704', 'A two sided cover for your sofa, bed, or decorative needs.\r\n', 'Non-bleached cotton canvas (non-coated)\r\n', '48 x 48 cm | 19 x 19 in', '', 5, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:06:12', NULL, NULL),
(246, 'Cushion Cover', 'HCC1705', 'A two sided cover for your sofa bed or decorative needs.', 'Non-bleached cotton canvas (non-coated).', '49 x 49 cm | 19.25 x 19.25 in', '', 5, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:06:45', '', '2017-12-19 04:24:14'),
(247, 'Cushion Cover', 'HCC1706', 'A two sided cover for your sofa bed or decorative needs.\r\n', 'Non-bleached cotton canvas (non-coated).', '49 x 49 cm | 19.25 x 19.25 in ', '', 5, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:07:21', '', '2017-12-19 04:25:45'),
(248, 'Cushion Cover', 'HCC1707', 'A two sided cover for your sofa bed or decorative needs.\r\n', 'Non-bleached cotton canvas (non-coated).\r\n', '49 x 49 cm | 19.25 x 19.25 in ', '', 5, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:07:36', '', '2017-12-19 04:27:05'),
(249, 'Cushion Cover', 'HCC1708', 'A two sided cover for your sofa bed or decorative needs.\r\n', 'Non-bleached cotton canvas (non-coated).\r\n', '49 x 49 cm | 19.25 x 19.25 in ', '', 5, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:07:36', '', '2017-12-19 04:28:12'),
(250, 'Cushion Cover', 'HCC1511', '', 'Non-bleached cotton canvas (non-coated).', '48 x 48 cm | 19 x 19 in', '', 17, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:09:12', '', '2017-12-19 04:29:49'),
(251, 'Tea Towel', 'HTT1601', '', 'Non-bleached cotton canvas (non-coated).', '48 x 80 cm | 19 x 31.5 in', '', 11, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:11:17', '', '2017-12-20 01:53:25'),
(252, 'Tea Towel', 'HTT1603', '', 'Non-bleached cotton canvas (non-coated).', '50 x 80 cm | 19.75 x 31.5 in', '', 11, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:11:45', '', '2017-12-20 01:55:05'),
(253, 'Tea Towel', 'HTT1604', '', 'Non-bleached cotton canvas (non-coated).', '50 x 80 cm | 19.75 x 31.5 in', '', 11, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:11:59', '', '2017-12-20 01:55:35'),
(254, 'Tea Towel', 'HTT1605', '', 'Non-bleached cotton canvas (non-coated).', '50 x 80 cm | 19.75 x 31.5 in', '', 11, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:12:42', '', '2017-12-20 01:56:19'),
(255, 'Tea Towel', 'HTT1606', '', 'Non-bleached cotton canvas (non-coated).', '50 x 80 cm | 19.75 x 31.5 in', '', 11, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:12:59', '', '2017-12-20 01:57:18'),
(256, 'Tea Towel', 'HTT1622', '', 'Non-bleached cotton canvas (non-coated).', '48 x 80 cm | 19 x 31.5 in', '', 9, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:13:44', '', '2017-12-20 01:58:33'),
(257, 'Tea Towel', 'HTT1624', '', 'Non-bleached cotton canvas (non-coated).', '50 x 80 cm | 19.75 x 31.5 in', '', 9, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:14:20', '', '2017-12-20 01:59:22'),
(258, 'Tea Towel', 'HTT1625', '', 'Non-bleached cotton canvas (non-coated).', '50 x 80 cm | 19.75 x 31.5 in', '', 9, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:14:49', '', '2017-12-20 02:00:27'),
(259, 'Tea Towel', 'HTT1626', '', 'Non-bleached cotton canvas (non-coated).', '50 x 80 cm | 19.75 x 31.5 in', '', 9, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:15:05', '', '2017-12-20 02:01:19'),
(260, 'Tea Towel', 'HTT1627', '', 'Non-bleached cotton canvas (non-coated).', '50 x 80 cm | 19.75 x 31.5 in', '', 9, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:15:18', '', '2017-12-20 02:02:01'),
(261, 'Tea Towel', 'HTT1701', 'Lit up the house with one of our signature product: the tea towel. It embellishes kitchen with quirky pattern or decorate the wall with cinematic illustration. Lay it upon the sofa for a quick up-do when guests are coming. The tea towel also preserves the original look of using raw cotton-canvas and uncoated finishing.\r\n', 'Non-bleached cotton canvas (non-coated)\r\n', '48 x 80 cm | 19 x 31.5 in', '', 5, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:16:14', '', '2017-12-20 02:03:02'),
(262, 'Tea Towel', 'HTT1702', 'Lit up the house with one of our signature product: the tea towel. It embellishes kitchen with quirky pattern or decorate the wall with cinematic illustration. Lay it upon the sofa for a quick up-do when guests are coming. The tea towel also preserves the original look of using raw cotton-canvas and uncoated finishing.\r\n', 'Non-bleached cotton canvas (non-coated)\r\n', '48 x 80 cm | 19 x 31.5 in', '', 5, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:16:48', '', '2017-12-20 02:03:17'),
(263, 'Tea Towel', 'HTT1703', 'Lit up the house with one of our signature product: the tea towel. It embellishes kitchen with quirky pattern or decorate the wall with cinematic illustration. Lay it upon the sofa for a quick up-do when guests are coming. The tea towel also preserves the original look of using raw cotton-canvas and uncoated finishing.\r\n', 'Non-bleached cotton canvas (non-coated)\r\n', '48 x 80 cm | 19 x 31.5 in', '', 5, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:17:33', '', '2017-12-20 02:03:34'),
(264, 'Tea Towel', 'HTT1704', 'Lit up the house with one of our signature product: the tea towel. It embellishes kitchen with quirky pattern or decorate the wall with cinematic illustration. Lay it upon the sofa for a quick up-do when guests are coming. The tea towel also preserves the original look of using raw cotton-canvas and uncoated finishing.\r\n', 'Non-bleached cotton canvas (non-coated)\r\n', '48 x 80 cm | 19 x 31.5 in', '', 5, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:18:13', NULL, NULL),
(265, 'Tea Towel', 'HTT1705', '', 'Non-bleached cotton canvas (non-coated).', '50 x 80 cm | 19.75 x 31.5 in', '', 5, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:18:39', '', '2017-12-20 02:04:36'),
(266, 'Tea Towel', 'HTT1706', '', 'Non-bleached cotton canvas (non-coated).', '50 x 80 cm | 19.75 x 31.5 in', '', 5, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:18:56', '', '2017-12-20 02:05:17'),
(267, 'Tea Towel', 'HTT1707', '', 'Non-bleached cotton canvas (non-coated).', '50 x 80 cm | 19.75 x 31.5 in', '', 5, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:19:16', '', '2017-12-20 02:05:38'),
(268, 'Tea Towel', 'HTT1708', '', 'Non-bleached cotton canvas (non-coated).', '50 x 80 cm | 19.75 x 31.5 in', '', 5, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:19:40', '', '2017-12-20 02:06:37'),
(269, 'Tea Towel', 'HTT1511', '', '', '48 x 80 cm | 19 x 31.5 in', '', 0, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:20:33', NULL, NULL),
(270, 'Placemats', 'HPM1603', '', 'Non-bleached cotton canvas (non-coated). set of two placemats.', '35 x 48 cm | 13.75 x 19 in', '', 11, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:21:54', 'aryaputra@tulisan.com', '2017-12-19 23:41:47'),
(271, 'Placemats', 'HPM1604', '', 'Non-bleached cotton canvas (non-coated). set of two placemats.', '35 x 48 cm | 13.75 x 19 in', '', 11, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:22:10', 'aryaputra@tulisan.com', '2017-12-19 23:43:08'),
(272, 'Placemats', 'HPM1605', '', 'on-bleached cotton canvas (non-coated). set of two placemats.', '35 x 48 cm | 13.75 x 19 in', '', 11, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:22:41', 'aryaputra@tulisan.com', '2017-12-19 23:46:21'),
(273, 'Placemats', 'HPM1624', '', 'Non-bleached cotton canvas (non-coated). set of two placemats.', '35 x 48 cm | 13.75 x 19 in', '', 9, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:23:06', 'aryaputra@tulisan.com', '2017-12-19 23:54:17'),
(274, 'Placemats', 'HPM1625', '', 'Non-bleached cotton canvas (non-coated). set of two placemats.', '35 x 48 cm | 13.75 x 19 in', '', 9, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:23:12', 'aryaputra@tulisan.com', '2017-12-19 23:55:17'),
(275, 'Placemats', 'HPM1626', '', 'Non-bleached cotton canvas (non-coated). set of two placemats.', '35 x 48 cm | 13.75 x 19 in', '', 9, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:24:15', 'aryaputra@tulisan.com', '2017-12-19 23:56:52'),
(276, 'Placemats', 'HPM1627', '', 'Non-bleached cotton canvas (non-coated). set of two placemats.', '35 x 48 cm | 13.75 x 19 in', '', 9, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:24:31', '', '2017-12-20 01:02:26'),
(277, 'Placemats', 'HPM1705', '', 'Non-bleached cotton canvas (non-coated). set of two placemats.', '35 x 48 cm | 13.75 x 19 in', '', 5, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:24:49', '', '2017-12-20 01:03:14'),
(278, 'Placemats', 'HPM1706', '', 'Non-bleached cotton canvas (non-coated). set of two placemats.', '35 x 48 cm | 13.75 x 19 in', '', 5, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:25:20', '', '2017-12-20 01:04:32'),
(279, 'Placemats', 'HPM1707', '', 'Non-bleached cotton canvas (non-coated). set of two placemats.', '35 x 48 cm | 13.75 x 19 in', '', 5, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:25:40', '', '2017-12-20 01:05:38'),
(280, 'Placemats', 'HPM1708', '', 'Non-bleached cotton canvas (non-coated). set of two placemats.', '35 x 48 cm | 13.75 x 19 in', '', 5, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:26:01', '', '2017-12-20 01:06:38'),
(281, 'Santiago', 'CCE1202', '', '', '', '', 0, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:30:36', NULL, NULL),
(282, 'Clio Children', 'CCL1202', '', '', '', '', 0, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:31:32', NULL, NULL),
(283, 'Clara Children', 'CCR1202', '', '', '', '', 0, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:33:20', NULL, NULL),
(284, 'Inaya Children', 'CIN1202', '', '', '', '', 0, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:34:16', NULL, NULL),
(285, 'Lila Children', 'CLI1301', '', '', '', '', 0, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:35:23', NULL, NULL),
(286, 'Lila Children', 'CLI2013', '', '', '', '', 0, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:36:01', NULL, NULL),
(287, 'Miya Children', 'CMI1202', '', '', '', '', 0, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:37:02', NULL, NULL),
(288, 'Oki Children', 'COK2013', '', '', '', '', 0, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:37:42', NULL, NULL),
(289, 'Pia Children', 'CPI1202', '', '', '', '', 0, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:38:49', NULL, NULL),
(290, 'Pia Children', 'CPI2013', '', '', '', '', 0, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:39:43', NULL, NULL),
(291, 'Tim Children', 'CTI2013', '', '', '', '', 0, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:40:17', NULL, NULL),
(292, 'Yoona Children', 'CYO1202', '', '', '', '', 0, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:40:55', NULL, NULL),
(293, 'Ziggy Children', 'CZI2013', '', '', '', '', 0, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:42:10', NULL, NULL),
(294, 'Sisilia Skirt', 'SSI1202', '', '', '', '', 0, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:42:54', NULL, NULL),
(295, 'Verona Skirt', 'SVE1301', '', '', '', '', 0, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:43:40', NULL, NULL),
(296, 'Mimosa Love Reverse', 'TAN1106R', '', '', '', '', 0, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:44:35', NULL, NULL),
(297, 'Celosia', 'TAN1202', '', '', '', '', 0, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:45:17', NULL, NULL),
(298, 'Florensia Tops', 'TFL1202', '', '', '', '', 0, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:46:55', NULL, NULL),
(299, 'Malta Tunic', 'TMA1202', '', '', '', '', 0, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:48:09', NULL, NULL),
(300, 'Mykonos Tunic', 'TMY1202', '', '', '', '', 0, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:48:53', NULL, NULL),
(301, 'Mykonos', 'TMY1202', '', '', '', '', 0, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:49:32', NULL, NULL),
(302, 'Toluca', 'TOL1201', '', '', '', '', 0, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:50:10', NULL, NULL),
(303, 'Toluca', 'TOL1202', '', '', '', '', 0, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 04:57:10', NULL, NULL),
(304, 'Toluca', 'TOL1204', '', '', '', '', 0, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 05:00:37', NULL, NULL),
(305, 'Toluca', 'TOL1205', '', '', '', '', 0, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 05:02:24', NULL, NULL),
(306, 'Tuscany', 'TUS1201', '', '', '', '', 0, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 05:03:39', NULL, NULL),
(307, 'Tuscany', 'TUS1202', '', '', '', '', 0, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 05:04:57', NULL, NULL),
(308, 'Tuscany', 'TUS1204', '', '', '', '', 0, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 05:06:36', NULL, NULL),
(309, 'Tuscany', 'TUS1205', '', '', '', '', 0, 0, NULL, NULL, 0, 'aryaputra@tulisan.com', '2017-12-15 05:07:35', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `products_variant`
--

CREATE TABLE `products_variant` (
  `idData` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `sku` varchar(20) NOT NULL,
  `artworkId` int(11) NOT NULL,
  `colorId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` varchar(20) DEFAULT NULL,
  `size` varchar(100) NOT NULL,
  `dimension` varchar(50) NOT NULL,
  `frontPicture` varchar(100) NOT NULL,
  `backPicture` varchar(100) NOT NULL,
  `topPicture` varchar(100) NOT NULL,
  `rightPicture` varchar(100) NOT NULL,
  `bottomPicture` varchar(100) NOT NULL,
  `leftPicture` varchar(100) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedby` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `products_variant`
--

INSERT INTO `products_variant` (`idData`, `productId`, `sku`, `artworkId`, `colorId`, `qty`, `price`, `size`, `dimension`, `frontPicture`, `backPicture`, `topPicture`, `rightPicture`, `bottomPicture`, `leftPicture`, `createdBy`, `createdDate`, `changedby`, `changedDate`) VALUES
(1, 84, '', 1, 3, 4, NULL, 'Medium', '', 'products_1_1.jpg', 'products_1_2.jpg', 'products_1_3.jpg', 'products_1_4.jpg', 'products_1_5.jpg', 'products_1_6.jpg', 'tes', '2017-11-27 00:00:00', 'admin@tulisan.com', '2017-11-29 14:07:31'),
(2, 84, '', 1, 3, 7, NULL, 'Large', '', 'products_2_1.jpg', 'products_2_2.jpg', 'products_2_3.jpg', '', '', '', 'tes', '2017-11-27 00:00:00', 'admin@tulisan.com', '2017-11-29 19:27:39'),
(3, 84, '', 0, 0, 1, NULL, 'Small', '', '', '', '', '', '', '', 'tes', '2017-11-27 00:00:00', 'admin@tulisan.com', '2017-11-29 11:58:02'),
(4, 85, '', 1, 4, 7, NULL, 'Small', '', 'products_4_1.jpg', '', '', '', '', '', 'tes', '2017-11-27 00:00:00', 'admin@tulisan.com', '2017-11-29 21:52:32'),
(5, 0, '', 2, 3, 0, NULL, 'Medium', '', '', '', '', '', '', '', 'admin@tulisan.com', '2017-11-29 13:43:15', NULL, NULL),
(6, 84, '', 2, 3, 13, NULL, 'Medium', '', 'products_6_1.jpg', '', '', '', '', '', 'admin@tulisan.com', '2017-11-29 13:44:36', 'admin@tulisan.com', '2017-11-29 16:05:19'),
(7, 84, '', 1, 3, 0, NULL, 'Small', '', 'products_7_1.jpg', '', '', '', '', '', 'admin@tulisan.com', '2017-11-29 13:47:38', 'admin@tulisan.com', '2017-11-29 13:53:00'),
(8, 84, '', 2, 4, 6, NULL, 'Large', '', 'products_8_1.jpg', '', '', '', '', '', 'admin@tulisan.com', '2017-11-29 18:45:49', NULL, NULL),
(9, 85, '', 1, 4, 4, NULL, 'Large', '', 'products_9_1.jpg', 'products_9_2.jpg', 'products_9_3.jpg', 'products_9_4.jpg', 'products_9_5.jpg', 'products_9_6.jpg', 'admin@tulisan.com', '2017-12-05 23:15:42', NULL, NULL),
(10, 85, '', 1, 4, 4, NULL, 'Large', '', 'products_10_1.jpg', 'products_10_2.jpg', 'products_10_3.jpg', 'products_10_4.jpg', 'products_10_5.jpg', 'products_10_6.jpg', 'admin@tulisan.com', '2017-12-05 23:16:00', NULL, NULL),
(11, 85, '', 1, 4, 4, NULL, 'Large', '', 'products_11_1.jpg', 'products_11_2.jpg', 'products_11_3.jpg', 'products_11_4.jpg', 'products_11_5.jpg', 'products_11_6.jpg', 'admin@tulisan.com', '2017-12-05 23:16:01', NULL, NULL),
(12, 85, '', 1, 4, 4, NULL, 'Large', '', 'products_12_1.jpg', 'products_12_2.jpg', 'products_12_3.jpg', 'products_12_4.jpg', 'products_12_5.jpg', 'products_12_6.jpg', 'admin@tulisan.com', '2017-12-05 23:16:01', NULL, NULL),
(13, 99, '', 1, 4, 5, 'NaN', 'Small', '', 'products_13_1.jpg', '', '', '', '', '', 'admin@tulisan.com', '2017-12-12 05:36:19', 'admin@tulisan.com', '2017-12-13 10:59:39'),
(14, 87, '', 14, 7, 0, '1298000', 'NULL', '', 'products_14_1.jpg', 'products_14_2.jpg', '', '', '', '', 'admin@tulisan.com', '2017-12-13 00:15:46', '', '2017-12-19 03:31:39'),
(15, 223, '', 8, 3, 0, '368000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 05:11:28', 'aryaputra@tulisan.com', '2017-12-18 10:13:28'),
(16, 223, '', 8, 58, 0, '368000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 05:13:26', 'aryaputra@tulisan.com', '2017-12-18 10:14:09'),
(17, 107, '', 16, 11, 1, '848000', 'NULL', '', 'products_17_1.jpg', 'products_17_2.jpg', 'products_17_3.jpg', '', 'products_17_5.jpg', 'products_17_6.jpg', 'aryaputra@tulisan.com', '2017-12-15 05:21:30', 'aryaputra@tulisan.com', '2017-12-19 23:03:09'),
(18, 107, '', 16, 15, 1, 'NaN', 'NULL', '', 'products_18_1.jpg', 'products_18_2.jpg', 'products_18_3.jpg', '', 'products_18_5.jpg', 'products_18_6.jpg', 'aryaputra@tulisan.com', '2017-12-15 05:22:36', 'aryaputra@tulisan.com', '2017-12-19 23:03:17'),
(19, 224, '', 9, 37, 0, '368000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 20:03:20', 'aryaputra@tulisan.com', '2017-12-18 10:15:21'),
(20, 224, '', 9, 42, 0, '368000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 20:03:40', 'aryaputra@tulisan.com', '2017-12-18 10:15:35'),
(21, 225, '', 15, 56, 0, '368000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 20:05:14', 'aryaputra@tulisan.com', '2017-12-18 10:16:39'),
(22, 225, '', 15, 55, 0, '368000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 20:06:51', 'aryaputra@tulisan.com', '2017-12-18 10:16:54'),
(23, 226, '', 16, 11, 0, '368000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 20:07:56', 'aryaputra@tulisan.com', '2017-12-18 10:17:33'),
(24, 226, '', 16, 15, 0, '368000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 20:08:08', 'aryaputra@tulisan.com', '2017-12-18 10:17:45'),
(25, 227, '', 17, 9, 0, '368000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 20:08:41', 'aryaputra@tulisan.com', '2017-12-18 10:19:06'),
(26, 227, '', 17, 18, 0, '368000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 20:09:02', 'aryaputra@tulisan.com', '2017-12-18 10:19:17'),
(27, 212, '', 0, 0, 0, '98000', 'NULL', '', 'products_27_1.jpg', 'products_27_2.jpg', 'products_27_3.jpg', 'products_27_4.jpg', 'products_27_5.jpg', 'products_27_6.jpg', 'aryaputra@tulisan.com', '2017-12-15 20:10:17', 'aryaputra@tulisan.com', '2017-12-20 23:44:51'),
(28, 217, '', 25, 19, 0, '148000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 20:11:00', 'aryaputra@tulisan.com', '2017-12-18 10:23:15'),
(29, 217, '', 25, 54, 0, '148000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 20:19:01', 'aryaputra@tulisan.com', '2017-12-18 10:23:28'),
(30, 218, '', 8, 3, 0, '148000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 20:20:53', 'aryaputra@tulisan.com', '2017-12-18 10:24:25'),
(31, 218, '', 8, 58, 0, '148000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 20:21:13', 'aryaputra@tulisan.com', '2017-12-18 10:24:38'),
(32, 219, '', 14, 31, 0, '148000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 20:23:57', 'aryaputra@tulisan.com', '2017-12-18 10:25:50'),
(33, 219, '', 14, 7, 0, '148000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 20:24:13', 'aryaputra@tulisan.com', '2017-12-18 10:26:05'),
(34, 220, '', 15, 56, 0, '148000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 20:26:26', 'aryaputra@tulisan.com', '2017-12-18 10:26:48'),
(35, 220, '', 15, 55, 0, '148000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 20:26:43', 'aryaputra@tulisan.com', '2017-12-18 10:26:59'),
(36, 221, '', 16, 11, 0, '148000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 20:51:13', 'aryaputra@tulisan.com', '2017-12-18 10:27:35'),
(37, 221, '', 16, 15, 0, '148000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 20:51:28', 'aryaputra@tulisan.com', '2017-12-18 10:27:46'),
(38, 222, '', 17, 9, 0, '148000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 20:52:04', 'aryaputra@tulisan.com', '2017-12-18 10:28:17'),
(39, 222, '', 17, 18, 0, '148000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 20:52:19', 'aryaputra@tulisan.com', '2017-12-18 10:28:28'),
(40, 198, '', 6, 32, 0, '148000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 20:52:57', 'aryaputra@tulisan.com', '2017-12-17 20:53:03'),
(41, 198, '', 6, 49, 0, '148000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 20:53:35', 'aryaputra@tulisan.com', '2017-12-17 20:53:50'),
(42, 199, '', 7, 53, 0, '148000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 20:54:23', 'aryaputra@tulisan.com', '2017-12-17 20:55:06'),
(43, 199, '', 7, 33, 0, '148000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 20:54:38', 'aryaputra@tulisan.com', '2017-12-17 20:57:56'),
(44, 200, '', 8, 3, 0, '148000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 20:55:08', 'aryaputra@tulisan.com', '2017-12-18 10:32:42'),
(45, 200, '', 8, 58, 0, '148000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 20:55:25', 'aryaputra@tulisan.com', '2017-12-18 10:32:56'),
(46, 201, '', 9, 37, 0, '148000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 20:56:00', 'aryaputra@tulisan.com', '2017-12-18 10:31:48'),
(47, 201, '', 9, 42, 0, '148000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 20:56:21', 'aryaputra@tulisan.com', '2017-12-18 10:32:01'),
(48, 202, '', 15, 56, 0, '148000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-15 22:47:14', 'aryaputra@tulisan.com', '2017-12-18 10:33:36'),
(49, 202, '', 15, 55, 0, '148000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-15 22:47:31', 'aryaputra@tulisan.com', '2017-12-18 10:33:50'),
(50, 203, '', 16, 11, 0, '148000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 22:56:33', 'aryaputra@tulisan.com', '2017-12-18 10:34:22'),
(51, 203, '', 16, 15, 0, '148000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 22:56:47', 'aryaputra@tulisan.com', '2017-12-18 10:34:36'),
(52, 204, '', 17, 9, 0, '148000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 22:57:21', 'aryaputra@tulisan.com', '2017-12-18 10:35:22'),
(53, 204, '', 17, 18, 0, '148000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 22:57:32', 'aryaputra@tulisan.com', '2017-12-18 10:35:36'),
(54, 207, '', 0, 0, 0, '498,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 22:58:07', NULL, NULL),
(55, 181, '', 20, 32, 0, '328000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 22:59:06', '', '2017-12-19 03:04:05'),
(56, 181, '', 20, 3, 0, '328000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 22:59:27', '', '2017-12-19 03:03:52'),
(57, 182, '', 21, 32, 0, '328000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 23:00:35', '', '2017-12-19 03:05:06'),
(58, 182, '', 21, 3, 0, '328000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 23:00:49', '', '2017-12-19 03:05:18'),
(59, 183, '', 25, 19, 0, '328000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 23:01:20', '', '2017-12-19 03:19:45'),
(60, 183, '', 25, 54, 0, '328000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 23:01:34', '', '2017-12-19 03:19:55'),
(61, 184, '', 22, 19, 0, '328000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 23:02:06', '', '2017-12-19 03:20:33'),
(62, 184, '', 22, 54, 0, '328000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 23:02:20', '', '2017-12-19 03:20:41'),
(63, 185, '', 6, 32, 0, '328000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 23:03:12', '', '2017-12-19 03:21:08'),
(64, 185, '', 6, 49, 0, '328000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 23:03:26', '', '2017-12-19 03:21:16'),
(65, 186, '', 7, 53, 0, '328000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 23:04:03', '', '2017-12-19 03:21:58'),
(66, 186, '', 7, 33, 0, '328000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 23:04:25', '', '2017-12-19 03:22:07'),
(67, 187, '', 8, 3, 0, '328000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 23:04:52', '', '2017-12-19 03:23:27'),
(68, 187, '', 8, 58, 0, '328000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 23:05:07', '', '2017-12-19 03:22:47'),
(69, 188, '', 9, 37, 0, '328000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 23:05:42', '', '2017-12-19 03:24:04'),
(70, 188, '', 9, 42, 0, '328000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 23:05:57', '', '2017-12-19 03:24:14'),
(71, 189, '', 14, 31, 0, '328000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 23:06:57', '', '2017-12-19 03:25:35'),
(72, 189, '', 14, 7, 0, '328000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 23:07:14', '', '2017-12-19 03:25:44'),
(73, 190, '', 15, 56, 0, '328000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 23:08:42', '', '2017-12-19 03:26:18'),
(74, 190, '', 15, 55, 0, '328000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 23:09:01', '', '2017-12-19 03:26:26'),
(75, 191, '', 16, 11, 0, '328000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 23:09:37', '', '2017-12-19 03:26:50'),
(76, 191, '', 16, 15, 0, '328000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 23:09:49', '', '2017-12-19 03:26:57'),
(77, 192, '', 17, 9, 0, '328000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 23:10:21', '', '2017-12-19 03:27:29'),
(78, 192, '', 17, 18, 0, '328000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 23:10:45', '', '2017-12-19 03:27:37'),
(79, 148, '', 15, 56, 0, '98000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 23:31:44', '', '2017-12-19 03:28:38'),
(80, 148, '', 15, 55, 0, '980000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-15 23:32:00', '', '2017-12-19 03:28:45'),
(81, 149, '', 16, 11, 0, '98000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 20:54:22', '', '2017-12-19 03:29:06'),
(82, 149, '', 16, 15, 0, '98000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 20:54:41', '', '2017-12-19 03:29:15'),
(83, 150, '', 17, 9, 0, '98000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 21:14:12', '', '2017-12-19 03:30:10'),
(84, 150, '', 17, 18, 0, '98000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 21:14:27', '', '2017-12-19 03:30:17'),
(85, 87, '', 14, 31, 0, '1298000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 21:15:15', '', '2017-12-19 03:31:24'),
(86, 100, '', 15, 56, 0, '1298000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 21:15:58', '', '2017-12-19 03:32:20'),
(87, 100, '', 15, 55, 0, '1298000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 21:16:12', '', '2017-12-19 03:32:31'),
(88, 101, '', 16, 11, 0, '1298000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 21:16:42', '', '2017-12-19 03:33:07'),
(89, 101, '', 16, 15, 0, '1298000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 21:16:58', '', '2017-12-19 03:33:14'),
(90, 102, '', 17, 9, 0, '1298000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 21:17:26', '', '2017-12-19 03:33:41'),
(91, 102, '', 17, 18, 0, '1298000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 21:17:43', '', '2017-12-19 03:33:47'),
(92, 228, '', 4, 55, 0, '468000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 21:19:18', '', '2017-12-19 03:34:58'),
(93, 228, '', 4, 3, 0, '468000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 21:19:31', '', '2017-12-19 03:35:08'),
(94, 229, '', 5, 21, 0, '468000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 21:28:51', '', '2017-12-19 03:35:41'),
(95, 229, '', 5, 52, 0, '468000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 21:29:06', '', '2017-12-19 03:35:50'),
(96, 230, '', 10, 31, 0, '468000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 22:12:51', '', '2017-12-19 03:36:34'),
(97, 231, '', 11, 7, 0, '468000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 22:15:13', '', '2017-12-19 03:37:08'),
(98, 232, '', 12, 46, 0, '468000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 22:19:06', '', '2017-12-19 03:37:58'),
(99, 233, '', 13, 9, 0, '468000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 22:20:45', '', '2017-12-19 03:38:51'),
(100, 136, '', 6, 32, 0, '268000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-16 22:22:00', '', '2017-12-19 03:40:24'),
(101, 136, '', 6, 32, 0, '188000', 'Small', '', '', '', '', '', '', '', '', '2017-12-16 22:22:22', '', '2017-12-19 03:40:37'),
(102, 136, '', 6, 49, 0, '268000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-16 22:22:46', '', '2017-12-19 03:40:47'),
(103, 136, '', 6, 49, 0, '188000', 'Small', '', '', '', '', '', '', '', '', '2017-12-16 22:23:07', '', '2017-12-19 03:41:03'),
(104, 137, '', 7, 53, 0, '268000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-16 22:23:57', '', '2017-12-19 03:50:58'),
(105, 137, '', 7, 53, 0, '188000', 'Small', '', '', '', '', '', '', '', '', '2017-12-16 22:24:10', '', '2017-12-19 03:51:10'),
(106, 137, '', 7, 33, 0, '268000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-16 22:24:25', '', '2017-12-19 03:51:17'),
(107, 137, '', 7, 33, 0, '188000', 'Small', '', '', '', '', '', '', '', '', '2017-12-16 22:24:39', '', '2017-12-19 03:51:30'),
(108, 138, '', 8, 3, 0, '268000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-16 22:25:19', '', '2017-12-19 03:52:49'),
(109, 138, '', 8, 3, 0, '188000', 'Small', '', '', '', '', '', '', '', '', '2017-12-16 22:25:37', '', '2017-12-19 03:53:08'),
(110, 138, '', 8, 58, 0, '268000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-16 22:25:50', '', '2017-12-19 03:53:14'),
(111, 138, '', 8, 58, 0, '188000', 'Small', '', '', '', '', '', '', '', '', '2017-12-16 22:26:02', '', '2017-12-19 03:53:27'),
(112, 139, '', 9, 37, 0, '268000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-16 22:26:33', '', '2017-12-19 03:54:08'),
(113, 139, '', 9, 37, 0, '188000', 'Small', '', '', '', '', '', '', '', '', '2017-12-16 22:26:48', '', '2017-12-19 03:54:16'),
(114, 139, '', 9, 42, 0, '268000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-16 22:27:01', '', '2017-12-19 03:54:24'),
(115, 139, '', 9, 42, 0, '188000', 'Small', '', '', '', '', '', '', '', '', '2017-12-16 22:27:17', '', '2017-12-19 03:54:31'),
(116, 140, '', 14, 31, 0, '268000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-16 22:34:52', '', '2017-12-19 03:56:13'),
(117, 140, '', 14, 31, 0, '188000', 'Small', '', '', '', '', '', '', '', '', '2017-12-16 22:35:17', '', '2017-12-19 03:59:16'),
(118, 140, '', 14, 7, 0, '268000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-16 22:35:34', '', '2017-12-19 03:59:36'),
(119, 140, '', 14, 7, 0, '188000', 'Small', '', '', '', '', '', '', '', '', '2017-12-16 22:35:51', '', '2017-12-19 03:59:47'),
(120, 141, '', 15, 56, 0, '268000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-16 22:36:36', '', '2017-12-19 04:00:53'),
(121, 141, '', 15, 56, 0, '188000', 'Small', '', '', '', '', '', '', '', '', '2017-12-16 22:36:48', '', '2017-12-19 04:01:06'),
(122, 141, '', 15, 55, 0, '268000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-16 22:37:01', '', '2017-12-19 04:01:15'),
(123, 141, '', 15, 55, 0, '188000', 'Small', '', '', '', '', '', '', '', '', '2017-12-16 22:37:13', '', '2017-12-19 04:01:56'),
(124, 142, '', 16, 11, 0, '268000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-16 22:37:40', '', '2017-12-19 04:03:03'),
(125, 142, '', 16, 11, 0, '188000', 'Small', '', '', '', '', '', '', '', '', '2017-12-16 22:37:49', '', '2017-12-19 04:03:14'),
(126, 142, '', 16, 15, 0, '268000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-16 22:38:02', '', '2017-12-19 04:04:02'),
(127, 142, '', 16, 15, 0, '188000', 'Small', '', '', '', '', '', '', '', '', '2017-12-16 22:38:17', '', '2017-12-19 04:04:42'),
(128, 143, '', 17, 9, 0, '268000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-16 22:38:41', '', '2017-12-19 04:05:38'),
(129, 143, '', 17, 9, 0, '188000', 'Small', '', '', '', '', '', '', '', '', '2017-12-16 22:38:52', '', '2017-12-19 04:05:45'),
(130, 143, '', 17, 18, 0, '268000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-16 22:39:04', '', '2017-12-19 04:05:56'),
(131, 143, '', 17, 18, 0, '188000', 'Small', '', '', '', '', '', '', '', '', '2017-12-16 22:39:16', '', '2017-12-19 04:06:04'),
(132, 234, '', 20, 3, 0, '398000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 22:40:06', '', '2017-12-19 04:07:07'),
(133, 234, '', 20, 32, 0, '398000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 22:40:24', '', '2017-12-19 04:07:19'),
(134, 235, '', 21, 3, 0, '398000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 22:40:57', '', '2017-12-19 04:07:54'),
(135, 235, '', 21, 32, 0, '398000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 22:41:13', '', '2017-12-19 04:08:04'),
(136, 236, '', 25, 19, 0, '398000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 22:41:43', '', '2017-12-19 04:08:34'),
(137, 236, '', 25, 54, 0, '398000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 22:41:55', '', '2017-12-19 04:09:11'),
(138, 237, '', 22, 19, 0, '398000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 22:42:34', '', '2017-12-19 04:12:34'),
(139, 237, '', 22, 54, 0, '398000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 22:42:52', '', '2017-12-19 04:12:42'),
(140, 238, '', 4, 55, 0, '528000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 22:55:18', '', '2017-12-19 04:14:14'),
(141, 238, '', 4, 3, 0, '528000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 22:55:32', '', '2017-12-19 04:14:26'),
(142, 239, '', 5, 21, 0, '528000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 22:56:11', '', '2017-12-19 04:16:11'),
(143, 239, '', 5, 52, 0, '528000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 22:56:29', '', '2017-12-19 04:16:18'),
(144, 240, '', 8, 3, 0, '398000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 22:58:00', '', '2017-12-19 04:17:52'),
(145, 240, '', 8, 58, 0, '398000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 22:58:17', '', '2017-12-19 04:18:00'),
(146, 241, '', 9, 37, 0, '398000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 22:58:59', '', '2017-12-19 04:18:58'),
(147, 241, '', 9, 42, 0, '398000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 22:59:11', '', '2017-12-19 04:19:05'),
(148, 242, '', 10, 31, 0, '528000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:00:01', '', '2017-12-19 04:20:08'),
(149, 243, '', 11, 7, 0, '528000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:00:24', '', '2017-12-19 04:20:51'),
(150, 244, '', 12, 46, 0, '528000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:00:56', '', '2017-12-19 04:21:50'),
(151, 245, '', 13, 9, 0, '528000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:01:21', '', '2017-12-19 04:22:08'),
(152, 246, '', 14, 31, 0, '398000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:01:47', '', '2017-12-19 04:24:37'),
(153, 246, '', 14, 7, 0, '398000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:01:58', '', '2017-12-19 04:24:47'),
(154, 247, '', 15, 56, 0, '398000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:03:50', '', '2017-12-19 04:26:09'),
(155, 247, '', 15, 55, 0, '398000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:04:03', '', '2017-12-19 04:26:16'),
(156, 248, '', 16, 11, 0, '398000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:04:46', '', '2017-12-19 04:27:26'),
(157, 248, '', 16, 15, 0, '398000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:04:58', '', '2017-12-19 04:27:33'),
(158, 249, '', 17, 9, 0, '398000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:05:25', '', '2017-12-19 04:28:54'),
(159, 249, '', 17, 18, 0, '398000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:05:54', '', '2017-12-19 04:29:02'),
(160, 250, '', 26, 26, 0, '522000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:07:18', '', '2017-12-19 04:32:53'),
(161, 250, '', 26, 56, 0, '522000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:08:04', '', '2017-12-19 04:33:02'),
(162, 210, '', 0, 0, 1, '86000', 'NULL', '', 'products_162_1.jpg', 'products_162_2.jpg', '', '', '', '', '', '2017-12-16 23:09:05', '', '2017-12-19 04:37:22'),
(163, 213, '', 0, 0, 0, '98000', 'NULL', '', 'products_163_1.jpg', 'products_163_2.jpg', 'products_163_3.jpg', 'products_163_4.jpg', 'products_163_5.jpg', 'products_163_6.jpg', '', '2017-12-16 23:09:44', '', '2017-12-19 04:44:34'),
(164, 214, '', 0, 33, 0, '1500000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:10:37', '', '2017-12-19 04:45:49'),
(165, 215, '', 0, 10, 0, '1,500,000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:11:07', NULL, NULL),
(166, 216, '', 0, 19, 0, '1,500,000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:11:33', NULL, NULL),
(167, 285, '', 0, 7, 0, '488,000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:15:18', NULL, NULL),
(168, 286, '', 0, 0, 0, '488,000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:16:53', NULL, NULL),
(169, 157, '', 20, 3, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:18:07', '', '2017-12-19 04:49:41'),
(170, 157, '', 20, 32, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:18:21', '', '2017-12-19 04:49:54'),
(171, 158, '', 21, 3, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:19:34', 'aryaputra@tulisan.com', '2017-12-19 22:26:49'),
(172, 158, '', 21, 32, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:19:47', 'aryaputra@tulisan.com', '2017-12-19 22:27:03'),
(173, 159, '', 25, 19, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:20:18', 'aryaputra@tulisan.com', '2017-12-19 22:28:28'),
(174, 159, '', 25, 54, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:20:37', 'aryaputra@tulisan.com', '2017-12-19 22:28:38'),
(175, 160, '', 22, 19, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:21:08', 'aryaputra@tulisan.com', '2017-12-19 22:29:40'),
(176, 160, '', 22, 54, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:21:18', 'aryaputra@tulisan.com', '2017-12-19 22:29:52'),
(177, 161, '', 6, 32, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:22:09', 'aryaputra@tulisan.com', '2017-12-19 22:30:58'),
(178, 161, '', 6, 49, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:22:20', 'aryaputra@tulisan.com', '2017-12-19 22:31:06'),
(179, 162, '', 7, 53, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:22:59', 'aryaputra@tulisan.com', '2017-12-19 22:32:30'),
(180, 162, '', 7, 33, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:23:11', 'aryaputra@tulisan.com', '2017-12-19 22:32:47'),
(181, 163, '', 8, 3, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:23:39', 'aryaputra@tulisan.com', '2017-12-19 22:34:00'),
(182, 163, '', 8, 58, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:25:09', 'aryaputra@tulisan.com', '2017-12-19 22:34:11'),
(183, 164, '', 9, 37, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:26:08', 'aryaputra@tulisan.com', '2017-12-19 22:35:10'),
(184, 164, '', 9, 42, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:26:20', 'aryaputra@tulisan.com', '2017-12-19 22:36:31'),
(185, 165, '', 14, 31, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:27:38', 'aryaputra@tulisan.com', '2017-12-19 22:37:45'),
(186, 165, '', 14, 7, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:27:49', 'aryaputra@tulisan.com', '2017-12-19 22:38:36'),
(187, 166, '', 15, 56, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:28:37', 'aryaputra@tulisan.com', '2017-12-19 22:39:48'),
(188, 166, '', 15, 55, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:28:52', 'aryaputra@tulisan.com', '2017-12-19 22:39:59'),
(189, 167, '', 16, 11, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:29:18', 'aryaputra@tulisan.com', '2017-12-19 22:40:48'),
(190, 167, '', 16, 15, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:29:28', 'aryaputra@tulisan.com', '2017-12-19 22:40:55'),
(191, 168, '', 17, 9, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:29:48', 'aryaputra@tulisan.com', '2017-12-19 22:41:39'),
(192, 168, '', 17, 18, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:30:01', 'aryaputra@tulisan.com', '2017-12-19 22:41:48'),
(193, 299, '', 0, 31, 0, '348,000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:31:10', NULL, NULL),
(194, 299, '', 0, 7, 0, '348,000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:31:29', NULL, NULL),
(195, 103, '', 15, 56, 0, '1398000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:32:05', 'aryaputra@tulisan.com', '2017-12-19 22:42:48'),
(196, 103, '', 15, 55, 0, '1398000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:32:20', 'aryaputra@tulisan.com', '2017-12-19 22:42:58'),
(197, 287, '', 0, 11, 0, '398,000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:33:59', NULL, NULL),
(198, 287, '', 0, 33, 0, '398,000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:34:24', NULL, NULL),
(199, 287, '', 0, 35, 0, '398,000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:34:37', NULL, NULL),
(200, 104, '', 17, 9, 0, '1398000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:35:19', 'aryaputra@tulisan.com', '2017-12-19 22:58:16'),
(201, 104, '', 17, 18, 0, '1398000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:35:31', 'aryaputra@tulisan.com', '2017-12-19 22:58:26'),
(202, 105, '', 15, 56, 0, '1398000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:35:57', 'aryaputra@tulisan.com', '2017-12-19 22:59:07'),
(203, 105, '', 15, 55, 0, '1398000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:36:12', 'aryaputra@tulisan.com', '2017-12-19 22:59:49'),
(204, 211, '', 0, 0, 0, '120,000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:37:03', NULL, NULL),
(205, 96, '', 14, 31, 0, '848000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:37:49', 'aryaputra@tulisan.com', '2017-12-19 23:01:24'),
(206, 96, '', 14, 7, 0, '848000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:38:07', 'aryaputra@tulisan.com', '2017-12-19 23:01:33'),
(207, 106, '', 15, 56, 0, '848000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:38:42', 'aryaputra@tulisan.com', '2017-12-19 23:02:20'),
(208, 106, '', 15, 55, 0, '848000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:39:18', 'aryaputra@tulisan.com', '2017-12-19 23:02:27'),
(209, 108, '', 17, 9, 0, '848000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:47:35', 'aryaputra@tulisan.com', '2017-12-19 23:04:26'),
(210, 108, '', 17, 18, 0, '848000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:47:48', 'aryaputra@tulisan.com', '2017-12-19 23:04:33'),
(211, 144, '', 8, 3, 0, '598000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:49:40', 'aryaputra@tulisan.com', '2017-12-19 23:08:38'),
(212, 144, '', 8, 58, 0, '598000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:49:52', 'aryaputra@tulisan.com', '2017-12-19 23:08:48'),
(213, 145, '', 15, 56, 0, '598000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:51:13', 'aryaputra@tulisan.com', '2017-12-19 23:09:27'),
(214, 145, '', 15, 55, 0, '598000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:51:22', 'aryaputra@tulisan.com', '2017-12-19 23:09:33'),
(215, 146, '', 16, 11, 0, '598000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:52:12', 'aryaputra@tulisan.com', '2017-12-19 23:10:08'),
(216, 146, '', 16, 15, 0, '598000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:52:28', 'aryaputra@tulisan.com', '2017-12-19 23:10:15'),
(217, 147, '', 17, 9, 0, '598000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:52:55', 'aryaputra@tulisan.com', '2017-12-19 23:10:41'),
(218, 147, '', 17, 18, 0, '598000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:53:06', 'aryaputra@tulisan.com', '2017-12-19 23:10:49'),
(219, 128, '', 6, 32, 0, '268000', 'Large', '', '', '', '', '', '', '', '', '2017-12-16 23:53:40', 'aryaputra@tulisan.com', '2017-12-19 23:11:42'),
(220, 128, '', 6, 32, 0, '188000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-16 23:54:15', 'aryaputra@tulisan.com', '2017-12-19 23:12:00'),
(221, 128, '', 6, 32, 0, '168000', 'Small', '', '', '', '', '', '', '', '', '2017-12-16 23:54:53', 'aryaputra@tulisan.com', '2017-12-19 23:12:11'),
(222, 128, '', 6, 32, 0, '148000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:56:14', 'aryaputra@tulisan.com', '2017-12-19 23:12:26'),
(223, 128, '', 6, 49, 0, '268000', 'Large', '', '', '', '', '', '', '', '', '2017-12-16 23:56:35', 'aryaputra@tulisan.com', '2017-12-19 23:12:45'),
(224, 128, '', 6, 49, 0, '188000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-16 23:56:54', 'aryaputra@tulisan.com', '2017-12-19 23:12:57'),
(225, 128, '', 6, 49, 0, '168000', 'Small', '', '', '', '', '', '', '', '', '2017-12-16 23:57:14', 'aryaputra@tulisan.com', '2017-12-19 23:13:07'),
(226, 128, '', 6, 49, 0, '148000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:57:29', 'aryaputra@tulisan.com', '2017-12-19 23:13:15'),
(227, 129, '', 7, 53, 0, '268000', 'Large', '', '', '', '', '', '', '', '', '2017-12-16 23:58:39', 'aryaputra@tulisan.com', '2017-12-19 23:14:29'),
(228, 129, '', 7, 53, 0, '188000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-16 23:58:56', 'aryaputra@tulisan.com', '2017-12-19 23:14:40'),
(229, 129, '', 7, 53, 0, '168000', 'Small', '', '', '', '', '', '', '', '', '2017-12-16 23:59:19', 'aryaputra@tulisan.com', '2017-12-19 23:14:50'),
(230, 129, '', 7, 53, 0, '148000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-16 23:59:35', 'aryaputra@tulisan.com', '2017-12-19 23:14:58'),
(231, 129, '', 7, 33, 0, '268000', 'Large', '', '', '', '', '', '', '', '', '2017-12-16 23:59:52', 'aryaputra@tulisan.com', '2017-12-19 23:15:10'),
(232, 129, '', 7, 33, 0, '188000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-17 00:00:06', 'aryaputra@tulisan.com', '2017-12-19 23:15:19'),
(233, 129, '', 7, 33, 0, '168000', 'Small', '', '', '', '', '', '', '', '', '2017-12-17 00:00:31', 'aryaputra@tulisan.com', '2017-12-19 23:15:26'),
(234, 129, '', 7, 33, 0, '148000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 00:00:47', 'aryaputra@tulisan.com', '2017-12-19 23:15:33'),
(235, 130, '', 8, 3, 0, '268000', 'Large', '', '', '', '', '', '', '', '', '2017-12-17 00:06:04', 'aryaputra@tulisan.com', '2017-12-19 23:16:24'),
(236, 130, '', 8, 3, 0, '188000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-17 00:06:16', 'aryaputra@tulisan.com', '2017-12-19 23:16:31'),
(237, 130, '', 8, 3, 0, '168000', 'Small', '', '', '', '', '', '', '', '', '2017-12-17 00:06:29', 'aryaputra@tulisan.com', '2017-12-19 23:16:39'),
(238, 130, '', 8, 3, 0, '148000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 00:06:40', 'aryaputra@tulisan.com', '2017-12-19 23:16:47'),
(239, 130, '', 8, 58, 0, '268000', 'Large', '', '', '', '', '', '', '', '', '2017-12-17 00:06:54', 'aryaputra@tulisan.com', '2017-12-19 23:16:55'),
(240, 130, '', 8, 58, 0, '188000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-17 00:07:10', 'aryaputra@tulisan.com', '2017-12-19 23:17:05'),
(241, 130, '', 8, 58, 0, '168000', 'Small', '', '', '', '', '', '', '', '', '2017-12-17 00:07:28', 'aryaputra@tulisan.com', '2017-12-19 23:17:14'),
(242, 130, '', 8, 58, 0, '148000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 00:07:42', 'aryaputra@tulisan.com', '2017-12-19 23:17:24'),
(243, 131, '', 9, 37, 0, '268000', 'Large', '', '', '', '', '', '', '', '', '2017-12-17 00:08:37', 'aryaputra@tulisan.com', '2017-12-19 23:18:06'),
(244, 131, '', 9, 37, 0, '188000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-17 00:08:51', 'aryaputra@tulisan.com', '2017-12-19 23:18:13'),
(245, 131, '', 9, 37, 0, '168000', 'Small', '', '', '', '', '', '', '', '', '2017-12-17 00:09:08', 'aryaputra@tulisan.com', '2017-12-19 23:18:25'),
(246, 131, '', 9, 37, 0, '148000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 00:09:23', 'aryaputra@tulisan.com', '2017-12-19 23:18:31'),
(247, 131, '', 9, 42, 0, '268000', 'Large', '', '', '', '', '', '', '', '', '2017-12-17 00:09:44', 'aryaputra@tulisan.com', '2017-12-19 23:18:38'),
(248, 131, '', 9, 42, 0, '188000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-17 00:10:00', 'aryaputra@tulisan.com', '2017-12-19 23:18:46'),
(249, 131, '', 9, 42, 0, '168000', 'Small', '', '', '', '', '', '', '', '', '2017-12-17 00:10:20', 'aryaputra@tulisan.com', '2017-12-19 23:18:54'),
(250, 131, '', 9, 42, 0, '148000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 00:10:36', 'aryaputra@tulisan.com', '2017-12-19 23:19:04'),
(251, 132, '', 14, 31, 0, '268000', 'Large', '', '', '', '', '', '', '', '', '2017-12-17 00:12:44', 'aryaputra@tulisan.com', '2017-12-19 23:20:45'),
(252, 132, '', 14, 31, 0, '188000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-17 00:12:58', 'aryaputra@tulisan.com', '2017-12-19 23:20:56'),
(253, 132, '', 14, 31, 0, '168000', 'Small', '', '', '', '', '', '', '', '', '2017-12-17 00:13:13', 'aryaputra@tulisan.com', '2017-12-19 23:21:03'),
(254, 132, '', 14, 31, 0, '148000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 00:13:27', 'aryaputra@tulisan.com', '2017-12-19 23:21:14'),
(255, 132, '', 14, 7, 0, '268000', 'Large', '', '', '', '', '', '', '', '', '2017-12-17 00:13:46', 'aryaputra@tulisan.com', '2017-12-19 23:21:20'),
(256, 132, '', 14, 7, 0, '188000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-17 00:14:02', 'aryaputra@tulisan.com', '2017-12-19 23:21:26'),
(257, 132, '', 14, 7, 0, '168000', 'Small', '', '', '', '', '', '', '', '', '2017-12-17 00:14:20', 'aryaputra@tulisan.com', '2017-12-19 23:21:38'),
(258, 132, '', 14, 7, 0, '148000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 00:14:33', 'aryaputra@tulisan.com', '2017-12-19 23:21:48'),
(259, 133, '', 15, 56, 0, '268000', 'Large', '', '', '', '', '', '', '', '', '2017-12-17 00:15:50', 'aryaputra@tulisan.com', '2017-12-19 23:22:44'),
(260, 133, '', 15, 56, 0, '188000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-17 00:16:03', 'aryaputra@tulisan.com', '2017-12-19 23:22:52'),
(261, 133, '', 15, 56, 0, '168000', 'Small', '', '', '', '', '', '', '', '', '2017-12-17 00:16:17', 'aryaputra@tulisan.com', '2017-12-19 23:22:58'),
(262, 133, '', 15, 56, 0, '148000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 00:16:51', 'aryaputra@tulisan.com', '2017-12-19 23:23:05'),
(263, 133, '', 15, 55, 0, '268000', 'Large', '', '', '', '', '', '', '', '', '2017-12-17 00:17:16', 'aryaputra@tulisan.com', '2017-12-19 23:23:17'),
(264, 133, '', 15, 55, 0, '188000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-17 00:17:31', 'aryaputra@tulisan.com', '2017-12-19 23:23:25'),
(265, 133, '', 15, 55, 0, '168000', 'Small', '', '', '', '', '', '', '', '', '2017-12-17 00:17:46', 'aryaputra@tulisan.com', '2017-12-19 23:23:32'),
(266, 133, '', 15, 55, 0, '148000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 00:17:59', 'aryaputra@tulisan.com', '2017-12-19 23:23:42'),
(267, 134, '', 16, 11, 0, '268000', 'Large', '', '', '', '', '', '', '', '', '2017-12-17 00:21:19', 'aryaputra@tulisan.com', '2017-12-19 23:26:46'),
(268, 134, '', 16, 11, 0, '188000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-17 00:21:30', 'aryaputra@tulisan.com', '2017-12-19 23:26:54'),
(269, 134, '', 16, 11, 0, '168000', 'Small', '', '', '', '', '', '', '', '', '2017-12-17 00:21:41', 'aryaputra@tulisan.com', '2017-12-19 23:27:01'),
(270, 134, '', 16, 11, 0, '148000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 00:21:58', 'aryaputra@tulisan.com', '2017-12-19 23:27:09'),
(271, 134, '', 16, 15, 0, '268000', 'Large', '', '', '', '', '', '', '', '', '2017-12-17 00:22:13', 'aryaputra@tulisan.com', '2017-12-19 23:27:24'),
(272, 134, '', 16, 15, 0, '188000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-17 00:22:27', 'aryaputra@tulisan.com', '2017-12-19 23:27:48'),
(273, 134, '', 16, 15, 0, '168000', 'Small', '', '', '', '', '', '', '', '', '2017-12-17 00:22:41', 'aryaputra@tulisan.com', '2017-12-19 23:27:58'),
(274, 134, '', 16, 15, 0, '148000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 00:23:11', 'aryaputra@tulisan.com', '2017-12-19 23:28:12'),
(275, 135, '', 17, 9, 0, '268000', 'Large', '', '', '', '', '', '', '', '', '2017-12-17 00:23:38', 'aryaputra@tulisan.com', '2017-12-19 23:29:02'),
(276, 135, '', 17, 9, 0, '188000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-17 00:23:49', 'aryaputra@tulisan.com', '2017-12-19 23:29:14'),
(277, 135, '', 17, 9, 0, '168000', 'Small', '', '', '', '', '', '', '', '', '2017-12-17 00:24:04', 'aryaputra@tulisan.com', '2017-12-19 23:29:20'),
(278, 135, '', 17, 9, 0, '148000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 00:24:27', 'aryaputra@tulisan.com', '2017-12-19 23:29:28'),
(279, 135, '', 17, 18, 0, '268000', 'Large', '', '', '', '', '', '', '', '', '2017-12-17 00:24:43', 'aryaputra@tulisan.com', '2017-12-19 23:29:36'),
(280, 135, '', 17, 18, 0, '188000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-17 00:25:05', 'aryaputra@tulisan.com', '2017-12-19 23:29:43'),
(281, 135, '', 17, 18, 0, '168000', 'Small', '', '', '', '', '', '', '', '', '2017-12-17 00:25:20', 'aryaputra@tulisan.com', '2017-12-19 23:29:57'),
(282, 135, '', 17, 18, 0, '148000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 00:25:45', 'aryaputra@tulisan.com', '2017-12-19 23:30:05'),
(283, 151, '', 7, 53, 0, '148000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 00:27:16', 'aryaputra@tulisan.com', '2017-12-19 23:33:18'),
(284, 151, '', 7, 33, 0, '148000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 00:27:30', 'aryaputra@tulisan.com', '2017-12-19 23:33:26'),
(285, 152, '', 8, 3, 0, '148000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 00:28:19', 'aryaputra@tulisan.com', '2017-12-19 23:34:41'),
(286, 152, '', 8, 58, 0, '148000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 00:28:31', 'aryaputra@tulisan.com', '2017-12-19 23:34:51'),
(287, 153, '', 9, 37, 0, '148000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 00:29:16', 'aryaputra@tulisan.com', '2017-12-19 23:35:25'),
(288, 153, '', 9, 58, 0, '148000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 00:29:33', 'aryaputra@tulisan.com', '2017-12-19 23:35:32'),
(289, 154, '', 15, 56, 0, '148000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 00:30:38', 'aryaputra@tulisan.com', '2017-12-19 23:36:14'),
(290, 154, '', 15, 55, 0, '148000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 00:30:56', 'aryaputra@tulisan.com', '2017-12-19 23:36:22'),
(291, 155, '', 16, 11, 0, '148000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 00:45:56', 'aryaputra@tulisan.com', '2017-12-19 23:36:58'),
(292, 155, '', 16, 15, 0, '148000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 00:46:13', 'aryaputra@tulisan.com', '2017-12-19 23:37:05'),
(293, 156, '', 17, 9, 0, '148000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:29:38', 'aryaputra@tulisan.com', '2017-12-19 23:37:28'),
(294, 156, '', 17, 18, 0, '148000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:29:54', 'aryaputra@tulisan.com', '2017-12-19 23:37:36'),
(295, 91, '', 0, 0, 1, '98000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:31:14', 'aryaputra@tulisan.com', '2017-12-19 23:39:50'),
(296, 289, '', 0, 11, 0, '188,000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:32:45', NULL, NULL),
(297, 289, '', 0, 33, 0, '188,000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:33:04', NULL, NULL),
(298, 289, '', 0, 35, 0, '188,000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:33:18', NULL, NULL),
(299, 270, '', 20, 3, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:34:39', 'aryaputra@tulisan.com', '2017-12-19 23:42:07'),
(300, 270, '', 20, 32, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:34:51', 'aryaputra@tulisan.com', '2017-12-19 23:42:16'),
(301, 271, '', 21, 3, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:35:16', 'aryaputra@tulisan.com', '2017-12-19 23:43:27'),
(302, 271, '', 21, 32, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:35:27', 'aryaputra@tulisan.com', '2017-12-19 23:43:35'),
(303, 272, '', 25, 19, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:37:17', 'aryaputra@tulisan.com', '2017-12-19 23:46:40'),
(304, 272, '', 25, 54, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:37:35', 'aryaputra@tulisan.com', '2017-12-19 23:47:21'),
(305, 273, '', 6, 32, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:38:08', 'aryaputra@tulisan.com', '2017-12-19 23:54:35'),
(306, 273, '', 6, 49, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:38:19', 'aryaputra@tulisan.com', '2017-12-19 23:54:42'),
(307, 274, '', 7, 53, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:38:42', 'aryaputra@tulisan.com', '2017-12-19 23:56:06'),
(308, 274, '', 7, 33, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:38:52', 'aryaputra@tulisan.com', '2017-12-19 23:56:14'),
(309, 275, '', 8, 3, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:39:16', 'aryaputra@tulisan.com', '2017-12-19 23:57:19'),
(310, 275, '', 8, 58, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:39:27', 'aryaputra@tulisan.com', '2017-12-19 23:57:26'),
(311, 276, '', 9, 37, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:39:55', 'aryaputra@tulisan.com', '2017-12-19 23:58:14'),
(312, 276, '', 9, 42, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:40:08', 'aryaputra@tulisan.com', '2017-12-19 23:58:20'),
(313, 277, '', 14, 31, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:40:47', '', '2017-12-20 01:03:43'),
(314, 277, '', 14, 7, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:41:03', '', '2017-12-20 01:03:52'),
(315, 278, '', 15, 56, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:41:40', '', '2017-12-20 01:05:01'),
(316, 278, '', 15, 55, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:41:49', '', '2017-12-20 01:05:08'),
(317, 279, '', 16, 11, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:42:12', '', '2017-12-20 01:05:57'),
(318, 279, '', 16, 15, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:42:12', '', '2017-12-20 01:06:06'),
(319, 280, '', 17, 9, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:42:56', '', '2017-12-20 01:06:57'),
(320, 280, '', 17, 18, 0, '348000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:43:09', '', '2017-12-20 01:07:08'),
(321, 206, '', 0, 0, 1, '250000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:44:10', '', '2017-12-20 01:08:09'),
(322, 205, '', 0, 0, 0, '300000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:44:32', 'aryaputra@tulisan.com', '2017-12-17 22:13:37'),
(323, 119, '', 6, 32, 0, '248000', 'Large', '', '', '', '', '', '', '', '', '2017-12-17 01:45:22', '', '2017-12-20 01:11:10'),
(324, 119, '', 6, 32, 0, '168000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-17 01:46:20', '', '2017-12-20 01:11:19'),
(325, 119, '', 6, 32, 0, '148000', 'Small', '', '', '', '', '', '', '', '', '2017-12-17 01:46:38', '', '2017-12-20 01:11:32'),
(326, 119, '', 6, 32, 0, '128000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:46:48', '', '2017-12-20 01:11:56'),
(327, 119, '', 6, 49, 0, '248000', 'Large', '', '', '', '', '', '', '', '', '2017-12-17 01:47:05', '', '2017-12-20 01:12:06'),
(328, 119, '', 6, 49, 0, '168000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-17 01:47:19', '', '2017-12-20 01:12:17'),
(329, 119, '', 6, 49, 0, '148000', 'Small', '', '', '', '', '', '', '', '', '2017-12-17 01:47:35', '', '2017-12-20 01:12:26'),
(330, 119, '', 6, 49, 0, '128000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:47:48', '', '2017-12-20 01:12:38'),
(331, 121, '', 7, 53, 0, '248000', 'Large', '', '', '', '', '', '', '', '', '2017-12-17 01:48:19', '', '2017-12-20 01:13:38'),
(332, 121, '', 7, 53, 0, '168000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-17 01:48:38', '', '2017-12-20 01:13:47'),
(333, 121, '', 7, 53, 0, '148000', 'Small', '', '', '', '', '', '', '', '', '2017-12-17 01:48:50', '', '2017-12-20 01:14:11'),
(334, 121, '', 7, 53, 0, '128000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:49:02', '', '2017-12-20 01:14:19'),
(335, 121, '', 7, 33, 0, '248000', 'Large', '', '', '', '', '', '', '', '', '2017-12-17 01:49:27', '', '2017-12-20 01:14:29'),
(336, 121, '', 7, 33, 0, '168000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-17 01:49:41', '', '2017-12-20 01:14:39'),
(337, 121, '', 7, 33, 0, '148000', 'Small', '', '', '', '', '', '', '', '', '2017-12-17 01:50:11', '', '2017-12-20 01:14:46'),
(338, 121, '', 7, 33, 0, '128000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:50:24', '', '2017-12-20 01:14:57'),
(339, 122, '', 8, 3, 0, '248000', 'Large', '', '', '', '', '', '', '', '', '2017-12-17 01:51:48', '', '2017-12-20 01:15:49'),
(340, 122, '', 8, 3, 0, '168000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-17 01:51:59', '', '2017-12-20 01:15:57'),
(341, 122, '', 8, 3, 0, '148000', 'Small', '', '', '', '', '', '', '', '', '2017-12-17 01:52:11', '', '2017-12-20 01:16:06'),
(342, 122, '', 8, 3, 0, '128000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:52:26', '', '2017-12-20 01:16:13'),
(343, 122, '', 8, 58, 0, '248000', 'Large', '', '', '', '', '', '', '', '', '2017-12-17 01:53:01', '', '2017-12-20 01:16:25'),
(344, 122, '', 8, 58, 0, '168000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-17 01:53:19', '', '2017-12-20 01:16:32'),
(345, 122, '', 8, 58, 0, '148000', 'Small', '', '', '', '', '', '', '', '', '2017-12-17 01:53:35', '', '2017-12-20 01:16:39'),
(346, 122, '', 8, 58, 0, '128000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:53:53', '', '2017-12-20 01:16:46'),
(347, 123, '', 9, 37, 0, '248000', 'Large', '', '', '', '', '', '', '', '', '2017-12-17 01:54:42', '', '2017-12-20 01:17:42'),
(348, 123, '', 9, 37, 0, '168000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-17 01:55:11', '', '2017-12-20 01:17:49'),
(349, 123, '', 9, 37, 0, '148000', 'Small', '', '', '', '', '', '', '', '', '2017-12-17 01:55:25', '', '2017-12-20 01:17:57'),
(350, 123, '', 9, 37, 0, '128000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:55:43', '', '2017-12-20 01:24:32'),
(351, 123, '', 9, 42, 0, '248000', 'Large', '', '', '', '', '', '', '', '', '2017-12-17 01:55:58', '', '2017-12-20 01:24:38');
INSERT INTO `products_variant` (`idData`, `productId`, `sku`, `artworkId`, `colorId`, `qty`, `price`, `size`, `dimension`, `frontPicture`, `backPicture`, `topPicture`, `rightPicture`, `bottomPicture`, `leftPicture`, `createdBy`, `createdDate`, `changedby`, `changedDate`) VALUES
(352, 123, '', 9, 42, 0, '168000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-17 01:56:10', '', '2017-12-20 01:24:54'),
(353, 123, '', 9, 42, 0, '148000', 'Small', '', '', '', '', '', '', '', '', '2017-12-17 01:56:25', '', '2017-12-20 01:25:03'),
(354, 123, '', 9, 42, 0, '128000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:56:36', '', '2017-12-20 01:25:15'),
(355, 124, '', 14, 31, 0, '248000', 'Large', '', '', '', '', '', '', '', '', '2017-12-17 01:57:10', '', '2017-12-20 01:26:00'),
(356, 124, '', 14, 31, 0, '168000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-17 01:57:22', '', '2017-12-20 01:26:06'),
(357, 124, '', 14, 31, 0, '148000', 'Small', '', '', '', '', '', '', '', '', '2017-12-17 01:57:35', '', '2017-12-20 01:26:13'),
(358, 124, '', 14, 31, 0, '128000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:57:49', '', '2017-12-20 01:26:19'),
(359, 124, '', 14, 7, 0, '248000', 'Large', '', '', '', '', '', '', '', '', '2017-12-17 01:58:02', '', '2017-12-20 01:26:26'),
(360, 124, '', 14, 7, 0, '168000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-17 01:58:13', '', '2017-12-20 01:26:33'),
(361, 124, '', 14, 7, 0, '148000', 'Small', '', '', '', '', '', '', '', '', '2017-12-17 01:58:28', '', '2017-12-20 01:26:42'),
(362, 124, '', 14, 7, 0, '128000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 01:58:58', '', '2017-12-20 01:26:52'),
(363, 125, '', 15, 56, 0, '248000', 'Large', '', '', '', '', '', '', '', '', '2017-12-17 01:59:37', '', '2017-12-20 01:27:34'),
(364, 125, '', 15, 56, 0, '168000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-17 01:59:49', '', '2017-12-20 01:27:42'),
(365, 125, '', 15, 56, 0, '148000', 'Small', '', '', '', '', '', '', '', '', '2017-12-17 02:00:04', '', '2017-12-20 01:27:52'),
(366, 125, '', 15, 56, 0, '128000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 02:00:14', '', '2017-12-20 01:28:01'),
(367, 125, '', 15, 55, 0, '248000', 'Large', '', '', '', '', '', '', '', '', '2017-12-17 02:00:26', '', '2017-12-20 01:28:10'),
(368, 125, '', 15, 55, 0, '168000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-17 02:00:41', '', '2017-12-20 01:28:23'),
(369, 125, '', 15, 55, 0, '148000', 'Small', '', '', '', '', '', '', '', '', '2017-12-17 02:00:57', '', '2017-12-20 01:28:41'),
(370, 125, '', 15, 55, 0, '128000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 02:01:09', '', '2017-12-20 01:28:53'),
(371, 126, '', 16, 11, 0, '248000', 'Large', '', '', '', '', '', '', '', '', '2017-12-17 02:02:04', '', '2017-12-20 01:29:17'),
(372, 126, '', 16, 11, 0, '168000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-17 02:06:17', '', '2017-12-20 01:29:24'),
(373, 126, '', 16, 11, 0, '148000', 'Small', '', '', '', '', '', '', '', '', '2017-12-17 02:06:33', '', '2017-12-20 01:29:31'),
(374, 126, '', 16, 11, 0, '128000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 02:06:44', '', '2017-12-20 01:29:38'),
(375, 126, '', 16, 15, 0, '248000', 'Large', '', '', '', '', '', '', '', '', '2017-12-17 02:06:57', '', '2017-12-20 01:29:44'),
(376, 126, '', 16, 15, 0, '168000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-17 02:07:09', '', '2017-12-20 01:29:52'),
(377, 126, '', 16, 15, 0, '148000', 'Small', '', '', '', '', '', '', '', '', '2017-12-17 02:08:55', '', '2017-12-20 01:30:00'),
(378, 126, '', 16, 15, 0, '128000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 02:09:09', '', '2017-12-20 01:30:10'),
(379, 127, '', 17, 9, 0, '248000', 'Large', '', '', '', '', '', '', '', '', '2017-12-17 02:10:18', '', '2017-12-20 01:33:16'),
(380, 127, '', 17, 9, 0, '168000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-17 02:10:30', '', '2017-12-20 01:33:27'),
(381, 127, '', 17, 9, 0, '148000', 'Small', '', '', '', '', '', '', '', '', '2017-12-17 02:10:44', '', '2017-12-20 01:34:06'),
(382, 127, '', 17, 9, 0, '128000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 02:10:52', '', '2017-12-20 01:34:19'),
(383, 127, '', 17, 18, 0, '248000', 'Large', '', '', '', '', '', '', '', '', '2017-12-17 02:11:04', '', '2017-12-20 01:34:31'),
(384, 127, '', 17, 18, 0, '168000', 'Medium', '', '', '', '', '', '', '', '', '2017-12-17 02:11:17', '', '2017-12-20 01:34:44'),
(385, 127, '', 17, 18, 0, '148000', 'Small', '', '', '', '', '', '', '', '', '2017-12-17 02:11:29', '', '2017-12-20 01:35:00'),
(386, 127, '', 17, 18, 0, '128000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 02:11:44', '', '2017-12-20 01:35:10'),
(387, 109, '', 5, 21, 0, '1498000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 02:12:57', '', '2017-12-20 01:37:43'),
(388, 109, '', 5, 52, 0, '1498000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 02:13:13', '', '2017-12-20 01:38:09'),
(389, 110, '', 4, 55, 0, '1498000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 02:13:52', '', '2017-12-20 01:39:05'),
(390, 110, '', 4, 3, 0, '1498000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 02:14:02', '', '2017-12-20 01:39:11'),
(391, 281, '', 0, 35, 0, '398,000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 02:15:39', NULL, NULL),
(392, 281, '', 0, 33, 0, '398,000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 02:16:37', NULL, NULL),
(393, 281, '', 0, 11, 0, '398,000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 02:16:48', NULL, NULL),
(394, 294, '', 0, 35, 0, '498,000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 02:17:58', NULL, NULL),
(395, 294, '', 0, 33, 0, '498,000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 02:18:08', NULL, NULL),
(396, 294, '', 0, 11, 0, '498,000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 02:18:19', NULL, NULL),
(397, 111, '', 5, 21, 0, '1498000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 02:19:20', '', '2017-12-20 01:40:23'),
(398, 111, '', 5, 52, 0, '1498000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 02:19:30', '', '2017-12-20 01:40:31'),
(399, 112, '', 4, 55, 0, '1498000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 02:19:52', '', '2017-12-20 01:41:42'),
(400, 112, '', 4, 3, 0, '1498000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 02:20:01', '', '2017-12-20 01:41:49'),
(401, 169, '', 20, 3, 0, '328000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 02:20:40', '', '2017-12-20 01:44:16'),
(402, 169, '', 20, 32, 0, '328000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 02:20:52', '', '2017-12-20 01:44:24'),
(403, 170, '', 21, 3, 0, '328000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 02:21:14', '', '2017-12-20 01:45:09'),
(404, 170, '', 21, 32, 0, '328000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 02:21:31', '', '2017-12-20 01:45:16'),
(405, 171, '', 25, 19, 0, '328000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 02:22:00', '', '2017-12-20 01:46:11'),
(406, 171, '', 25, 54, 0, '328000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 02:22:12', '', '2017-12-20 01:46:27'),
(407, 172, '', 22, 19, 0, '328000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 02:22:36', '', '2017-12-20 01:47:18'),
(408, 172, '', 22, 54, 0, '328000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-17 02:22:47', '', '2017-12-20 01:47:26'),
(409, 173, '', 6, 32, 0, '328000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 08:59:52', '', '2017-12-20 01:48:19'),
(410, 173, '', 6, 49, 0, '328,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:00:17', NULL, NULL),
(411, 174, '', 7, 53, 0, '328,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:01:00', NULL, NULL),
(412, 174, '', 7, 33, 0, '328,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:01:20', NULL, NULL),
(413, 175, '', 8, 3, 0, '328,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:02:20', NULL, NULL),
(414, 175, '', 8, 58, 0, '328,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:02:47', NULL, NULL),
(415, 176, '', 9, 37, 0, '328,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:03:41', NULL, NULL),
(416, 176, '', 9, 42, 0, '328,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:04:04', NULL, NULL),
(417, 177, '', 14, 31, 0, '328,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:05:30', NULL, NULL),
(418, 177, '', 14, 7, 0, '328,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:05:48', NULL, NULL),
(419, 178, '', 15, 56, 0, '328,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:06:37', NULL, NULL),
(420, 178, '', 15, 55, 0, '328,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:06:55', NULL, NULL),
(421, 179, '', 16, 11, 0, '328,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:08:19', NULL, NULL),
(422, 179, '', 16, 15, 0, '328,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:08:37', NULL, NULL),
(423, 180, '', 17, 9, 0, '328,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:09:20', NULL, NULL),
(424, 180, '', 17, 18, 0, '328,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:09:36', NULL, NULL),
(425, 208, '', 0, 0, 0, '88,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:17:44', NULL, NULL),
(426, 209, '', 19, 0, 0, '100,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:33:07', NULL, NULL),
(427, 251, '', 23, 3, 0, '388,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:35:52', NULL, NULL),
(428, 252, '', 20, 3, 0, '358,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:37:26', NULL, NULL),
(429, 252, '', 20, 32, 0, '358,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:37:45', NULL, NULL),
(430, 253, '', 21, 3, 0, '358,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:38:23', NULL, NULL),
(431, 253, '', 21, 32, 0, '358,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:38:38', NULL, NULL),
(432, 254, '', 25, 19, 0, '358,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:39:22', NULL, NULL),
(433, 254, '', 25, 54, 0, '358,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:39:56', NULL, NULL),
(434, 255, '', 22, 19, 0, '358,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:40:37', NULL, NULL),
(435, 255, '', 22, 54, 0, '358,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:40:56', NULL, NULL),
(436, 256, '', 4, 55, 0, '388,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:42:19', NULL, NULL),
(437, 256, '', 4, 3, 0, '388,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:42:32', NULL, NULL),
(438, 257, '', 6, 32, 0, '358,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:43:18', NULL, NULL),
(439, 257, '', 6, 49, 0, '358,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:43:37', NULL, NULL),
(440, 258, '', 7, 53, 0, '358,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:45:03', NULL, NULL),
(441, 258, '', 7, 33, 0, '358,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:45:21', NULL, NULL),
(442, 259, '', 8, 3, 0, '358,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:46:26', NULL, NULL),
(443, 259, '', 8, 58, 0, '358,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:46:43', NULL, NULL),
(444, 260, '', 9, 37, 0, '358,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:47:29', NULL, NULL),
(445, 260, '', 9, 42, 0, '358,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:47:54', NULL, NULL),
(446, 261, '', 10, 32, 0, '388,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:49:41', NULL, NULL),
(447, 262, '', 11, 7, 0, '388,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:50:30', NULL, NULL),
(448, 263, '', 12, 46, 0, '388,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:51:45', NULL, NULL),
(449, 264, '', 13, 9, 0, '388,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:53:20', NULL, NULL),
(450, 265, '', 14, 31, 0, '358,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:54:29', NULL, NULL),
(451, 265, '', 14, 7, 0, '358,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:54:49', NULL, NULL),
(452, 266, '', 15, 56, 0, '358,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:55:45', NULL, NULL),
(453, 266, '', 15, 55, 0, '358,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:56:05', NULL, NULL),
(454, 267, '', 16, 11, 0, '358,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:56:53', NULL, NULL),
(455, 267, '', 16, 15, 0, '358,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:57:09', NULL, NULL),
(456, 268, '', 17, 9, 0, '358,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:58:04', NULL, NULL),
(457, 268, '', 17, 18, 0, '358,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 09:59:23', NULL, NULL),
(458, 193, '', 20, 3, 0, '398,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 10:02:03', NULL, NULL),
(459, 193, '', 20, 32, 0, '398,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 10:02:22', NULL, NULL),
(460, 194, '', 21, 3, 0, '398,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 10:03:07', NULL, NULL),
(461, 194, '', 21, 32, 0, '398,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 10:03:22', NULL, NULL),
(462, 195, '', 25, 19, 0, '398,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 10:04:17', NULL, NULL),
(463, 195, '', 25, 54, 0, '398,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 10:04:37', NULL, NULL),
(464, 196, '', 22, 19, 0, '398,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 10:05:25', NULL, NULL),
(465, 196, '', 22, 54, 0, '398,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 10:05:41', NULL, NULL),
(466, 197, '', 16, 11, 0, '398,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 10:06:21', NULL, NULL),
(467, 197, '', 16, 15, 0, '398,000', 'NULL', '', '', '', '', '', '', '', 'aryaputra@tulisan.com', '2017-12-18 10:06:38', NULL, NULL),
(468, 113, '', 20, 3, 0, '1,398,000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-20 02:08:27', NULL, NULL),
(469, 113, '', 20, 32, 0, '1,398,000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-20 02:08:59', NULL, NULL),
(470, 114, '', 21, 3, 0, '1,398,000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-20 02:10:38', NULL, NULL),
(471, 114, '', 21, 32, 0, '1,398,000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-20 02:11:02', NULL, NULL),
(472, 115, '', 25, 19, 0, '1,398,000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-20 02:12:55', NULL, NULL),
(473, 115, '', 25, 54, 0, '1,398,000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-20 02:13:14', NULL, NULL),
(474, 116, '', 22, 19, 0, '1,398,000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-20 02:14:24', NULL, NULL),
(475, 116, '', 22, 54, 0, '1,398,000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-20 02:15:04', NULL, NULL),
(476, 117, '', 8, 3, 0, '1,398,000', 'NULL', '', '', '', '', '', '', '', '', '2017-12-20 02:16:50', NULL, NULL),
(477, 117, '', 8, 58, 0, '', 'NULL', '', '', '', '', '', '', '', '', '2017-12-20 02:17:20', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `shipping_options`
--

CREATE TABLE `shipping_options` (
  `idData` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `idData` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `departmentId` int(11) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `confirmation` varchar(10) NOT NULL DEFAULT 'no',
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`idData`, `name`, `username`, `password`, `type`, `departmentId`, `picture`, `confirmation`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(0, 'Administrator', 'admin@tulisan.com', '21232f297a57a5a743894a0e4a801fc3', 'admin', 1, 'users_1.gif', 'belum', 'SESSION_TEST', '2017-10-23 19:57:19', 'SESSION_TEST', '2017-10-23 20:10:30'),
(3, 'megan', 'megan@syncard.com', '202cb962ac59075b964b07152d234b70', 'admin', 4, 'users_3.jpg', 'belum', 'SESSION_TEST', '2017-10-23 20:13:56', 'SESSION_TEST', '2017-10-23 20:22:18'),
(4, 'Demo Customer', 'demo@tulisan.com', 'fe01ce2a7fbac8fafaed7c982a04e229', 'Customer', 0, 'users_4.jpg', 'belum', 'SESSION_TEST', '2017-10-23 21:32:06', 'SESSION_TEST', '2017-11-14 20:57:17'),
(5, 'Arya Putra Gautama', 'aryaputra@tulisan.com', 'a372c11ba72c8688579b1794d0ef4fbb', 'admin', 4, 'users_5_20171214111550am.JPG', 'no', 'admin@tulisan.com', '2017-12-14 11:14:17', 'admin@tulisan.com', '2017-12-14 11:19:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `vendors`
--

CREATE TABLE `vendors` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `vendors`
--

INSERT INTO `vendors` (`idData`, `name`, `address`, `city`, `country`, `zipCode`, `phone`, `email`, `company`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(3, 'Vendor 1', 'Jalan... ', 'Bandung', 'Indon', 'xxxxx', '123', 'email@co.com', 'No Company', 'SESSION_TEST', '2017-10-23 22:10:27', 'SESSION_TEST', '2017-10-23 22:13:52');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cancelation`
--
ALTER TABLE `cancelation`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `cms_blog`
--
ALTER TABLE `cms_blog`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `cms_chatter`
--
ALTER TABLE `cms_chatter`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `cms_home`
--
ALTER TABLE `cms_home`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `cms_home_gallery`
--
ALTER TABLE `cms_home_gallery`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `cms_story`
--
ALTER TABLE `cms_story`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `cms_story_artwork`
--
ALTER TABLE `cms_story_artwork`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `cms_video`
--
ALTER TABLE `cms_video`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `orders_item`
--
ALTER TABLE `orders_item`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `products_variant`
--
ALTER TABLE `products_variant`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `shipping_options`
--
ALTER TABLE `shipping_options`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idData`);

--
-- Indeks untuk tabel `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`idData`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cancelation`
--
ALTER TABLE `cancelation`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `cms_blog`
--
ALTER TABLE `cms_blog`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `cms_chatter`
--
ALTER TABLE `cms_chatter`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `cms_home`
--
ALTER TABLE `cms_home`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `cms_home_gallery`
--
ALTER TABLE `cms_home_gallery`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `cms_story`
--
ALTER TABLE `cms_story`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `cms_story_artwork`
--
ALTER TABLE `cms_story_artwork`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `cms_video`
--
ALTER TABLE `cms_video`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `colors`
--
ALTER TABLE `colors`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT untuk tabel `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;

--
-- AUTO_INCREMENT untuk tabel `customers`
--
ALTER TABLE `customers`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `departments`
--
ALTER TABLE `departments`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `feedback`
--
ALTER TABLE `feedback`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `orders_item`
--
ALTER TABLE `orders_item`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=310;

--
-- AUTO_INCREMENT untuk tabel `products_variant`
--
ALTER TABLE `products_variant`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=478;

--
-- AUTO_INCREMENT untuk tabel `shipping_options`
--
ALTER TABLE `shipping_options`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `vendors`
--
ALTER TABLE `vendors`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
