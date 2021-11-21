CREATE TABLE STOP_TIMES (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  trip_id bigint(20) NOT NULL,
  arrival_time  TIMESTAMP WITH TIME ZONE NOT NULL,
  departure_time  TIMESTAMP WITH TIME ZONE NOT NULL,
  stop_id bigint(20) NOT NULL,
  stop_sequence int,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE STOPS (
  stop_id bigint(20) NOT NULL AUTO_INCREMENT,
  stop_name varchar(50) NOT NULL,
  stop_lat varchar(50) NOT NULL,
  stop_lon varchar(50) NOT NULL,
  station_id bigint(20) NOT NULL,
  active boolean,
  PRIMARY KEY (stop_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE STOPS_IN_ROUTE (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  route_id bigint(20) NOT NULL,
  stop_id bigint(20) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE FARE_ATTRIBUTES (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  fare_id bigint(20) NOT NULL,
  price int NOT NULL,
  currency_type varchar(3),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE FARE_RULES (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  fare_id bigint(20) NOT NULL,
  origin_id bigint(20) NOT NULL,
  destination_id bigint(20) NOT NULL, 
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE ROUTES (
  route_id bigint(20) NOT NULL AUTO_INCREMENT,
  route_name varchar(20),
  PRIMARY KEY (route_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE TRIPS (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  route_id bigint(20) NOT NULL,
  service_id bigint(20) NOT NULL,
  trip_id bigint(20) NOT NULL,
  trip_headsign varchar(20),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE TRIPS_IN_SCHEDULE (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  schedule_id bigint(20) NOT NULL, 
  trip_id bigint(20) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE CALENDER (
  service_id bigint(20) NOT NULL AUTO_INCREMENT,
  monday boolean,
  tuesday boolean,
  wednesday boolean,
  thursday boolean,
  friday boolean,
  saturday boolean,
  sunday boolean,
  start_date TIMESTAMP WITH TIME ZONE NOT NULL,
  end_date TIMESTAMP WITH TIME ZONE NOT NULL,
  PRIMARY KEY (service_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE SCHEDULE (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  start_date TIMESTAMP WITH TIME ZONE NOT NULL,
  end_date TIMESTAMP WITH TIME ZONE NOT NULL,
  active boolean,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE SCHEDULED_JOURNEY (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  schedule_id bigint(20) NOT NULL,
  boat_id  bigint(20) NOT NULL,
  journey_date TIMESTAMP WITH TIME ZONE NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE SALES_RECORDS (
  order_id bigint(20) NOT NULL AUTO_INCREMENT,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL,
  created_by varchar(20),
  origin_jetty varchar(20),
  destination_jetty varchar(20),
  number_of_tickets int,
  amount_paid bigint(20) NOT NULL,
  ticket_fare bigint(20) NOT NULL,
  schedule_id bigint(20) NOT NULL,
  boat_id bigint(20) NOT NULL,
  trip_id bigint(20) NOT NULL,
  date_of_journey  TIMESTAMP WITH TIME ZONE NOT NULL,
  status varchar,
  signature varchar,
  PRIMARY KEY (order_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE BOATS (
  boat_id bigint(20) NOT NULL AUTO_INCREMENT,
  capacity int NOT NULL,
  station_id bigint(20) NOT NULL,
  PRIMARY KEY (boat_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;