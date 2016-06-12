package util;

import java.text.ParseException;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.inject.Inject;
import javax.inject.Provider;
import javax.inject.Singleton;

import play.data.format.Formatters;
import play.data.format.Formatters.SimpleFormatter;
import play.i18n.MessagesApi;
import play.db.jpa.*;
import models.Type;


@Singleton
public class FormattersProvider implements Provider<Formatters> {

    private final MessagesApi messagesApi;

    @Inject
    public FormattersProvider(MessagesApi messagesApi) {
        this.messagesApi = messagesApi;
    }

    @Override
    public Formatters get() {
        Formatters formatters = new Formatters(messagesApi);

        formatters.register(Type.class, new SimpleFormatter<Type>() {

/*            private Pattern timePattern = Pattern.compile(
                    "([012]?\\d)(?:[\\s:\\._\\-]+([0-5]\\d))?"
            );*/

            @Override
            @Transactional
            public Type parse(String input, Locale l) throws ParseException {
                Type type = JPA.em().find(Type.class, Integer.parseInt(input));
                return type;
                /*return Type.find.byId(Integer.parseInt(input));
                
                Matcher m = timePattern.matcher(input);
                if (!m.find()) throw new ParseException("No valid Input", 0);
                int hour = Integer.valueOf(m.group(1));
                int min = m.group(2) == null ? 0 : Integer.valueOf(m.group(2));
                return new LocalTime(hour, min);*/
            }

            @Override
            public String print(Type type, Locale l) {
                return type.getId()+"";
            }
        });

        return formatters;
    }
}