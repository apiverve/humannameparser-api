// Converter.java

// To use this code, add the following Maven dependency to your project:
//
//
//     com.fasterxml.jackson.core     : jackson-databind          : 2.9.0
//     com.fasterxml.jackson.datatype : jackson-datatype-jsr310   : 2.9.0
//
// Import this package:
//
//     import com.apiverve.data.Converter;
//
// Then you can deserialize a JSON string with
//
//     HumanNameParserData data = Converter.fromJsonString(jsonString);

package com.apiverve.humannameparser.data;

import java.io.IOException;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.*;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.OffsetTime;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;

public class Converter {
    // Date-time helpers

    private static final DateTimeFormatter DATE_TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_INSTANT)
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ssX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetDateTime parseDateTimeString(String str) {
        return ZonedDateTime.from(Converter.DATE_TIME_FORMATTER.parse(str)).toOffsetDateTime();
    }

    private static final DateTimeFormatter TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_TIME)
            .parseDefaulting(ChronoField.YEAR, 2020)
            .parseDefaulting(ChronoField.MONTH_OF_YEAR, 1)
            .parseDefaulting(ChronoField.DAY_OF_MONTH, 1)
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetTime parseTimeString(String str) {
        return ZonedDateTime.from(Converter.TIME_FORMATTER.parse(str)).toOffsetDateTime().toOffsetTime();
    }
    // Serialize/deserialize helpers

    public static HumanNameParserData fromJsonString(String json) throws IOException {
        return getObjectReader().readValue(json);
    }

    public static String toJsonString(HumanNameParserData obj) throws JsonProcessingException {
        return getObjectWriter().writeValueAsString(obj);
    }

    private static ObjectReader reader;
    private static ObjectWriter writer;

    private static void instantiateMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.findAndRegisterModules();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        SimpleModule module = new SimpleModule();
        module.addDeserializer(OffsetDateTime.class, new JsonDeserializer<OffsetDateTime>() {
            @Override
            public OffsetDateTime deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException {
                String value = jsonParser.getText();
                return Converter.parseDateTimeString(value);
            }
        });
        mapper.registerModule(module);
        reader = mapper.readerFor(HumanNameParserData.class);
        writer = mapper.writerFor(HumanNameParserData.class);
    }

    private static ObjectReader getObjectReader() {
        if (reader == null) instantiateMapper();
        return reader;
    }

    private static ObjectWriter getObjectWriter() {
        if (writer == null) instantiateMapper();
        return writer;
    }
}

// HumanNameParserData.java

package com.apiverve.humannameparser.data;

import com.fasterxml.jackson.annotation.*;

public class HumanNameParserData {
    private String name;
    private Parsed parsed;

    @JsonProperty("name")
    public String getName() { return name; }
    @JsonProperty("name")
    public void setName(String value) { this.name = value; }

    @JsonProperty("parsed")
    public Parsed getParsed() { return parsed; }
    @JsonProperty("parsed")
    public void setParsed(Parsed value) { this.parsed = value; }
}

// Parsed.java

package com.apiverve.humannameparser.data;

import com.fasterxml.jackson.annotation.*;

public class Parsed {
    private String title;
    private String first;
    private String middle;
    private String last;
    private String nick;
    private String suffix;

    @JsonProperty("title")
    public String getTitle() { return title; }
    @JsonProperty("title")
    public void setTitle(String value) { this.title = value; }

    @JsonProperty("first")
    public String getFirst() { return first; }
    @JsonProperty("first")
    public void setFirst(String value) { this.first = value; }

    @JsonProperty("middle")
    public String getMiddle() { return middle; }
    @JsonProperty("middle")
    public void setMiddle(String value) { this.middle = value; }

    @JsonProperty("last")
    public String getLast() { return last; }
    @JsonProperty("last")
    public void setLast(String value) { this.last = value; }

    @JsonProperty("nick")
    public String getNick() { return nick; }
    @JsonProperty("nick")
    public void setNick(String value) { this.nick = value; }

    @JsonProperty("suffix")
    public String getSuffix() { return suffix; }
    @JsonProperty("suffix")
    public void setSuffix(String value) { this.suffix = value; }
}