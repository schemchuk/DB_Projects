use db_videos;
# Создать таблицы реакций и комментариев
#
# Добавить несколько записей в каждую таблицу выше
create table video_comments (
                                video_comments_id int,
                                created_at timestamp,
                                author_id int,
                                content text,
                                video_id int
);

insert into  video_comments(video_comments_id, created_at, author_id, content, video_id)
values
    (1,current_timestamp,1,'I need this video',2),
    (2, current_timestamp,1,'It is a ugly video',3);

create table  video_reactions(
                                 video_reactions_id int,
                                 created_at timestamp,
                                 author_id int,
                                 value int,
                                 video_id int
);

insert into video_reactions(video_reactions_id, created_at, author_id, value, video_id)
values
    (1,current_timestamp,1,5,2),
    (2,current_timestamp,1,3,4);


