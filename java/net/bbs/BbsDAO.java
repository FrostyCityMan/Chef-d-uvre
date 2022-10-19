package net.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.utility.DBClose;
import net.utility.DBOpen;

public class BbsDAO { // 데이터베이스 관련 작업
    private DBOpen dbopen = null;
    private Connection con = null; // 데이터베이스 연동
    private PreparedStatement pstmt = null; // sql문 입력
    private ResultSet rs = null; // 커서
    private StringBuilder sql = null;

    public BbsDAO() {
        dbopen = new DBOpen();
    }

    public int create(BbsDTO dto) {
        int cnt = 0;
        try {
            con = dbopen.getConnection();

            sql = new StringBuilder();
            sql.append(" INSERT INTO tb_bbs(bbsno, wname, subject, content, passwd, ip, grpno)");
            sql.append(" VALUES (bbs_seq.nextval, ?, ?, ?, ?, ?, (SELECT NVL(MAX(bbsno),0)+1 FROM tb_bbs))");

            pstmt = con.prepareStatement(sql.toString());
            pstmt.setString(1, dto.getWname());
            pstmt.setString(2, dto.getSubject());
            pstmt.setString(3, dto.getContent());
            pstmt.setString(4, dto.getPasswd());
            pstmt.setString(5, dto.getIp());

            cnt = pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("추가실패" + e);

        } finally {
            DBClose.Close(con, pstmt);
        }
        return cnt;
    }// end create

    public ArrayList<BbsDTO> list() {
        ArrayList<BbsDTO> list = null;
        try {
            con = dbopen.getConnection();

            sql = new StringBuilder();
            sql.append(" SELECT grpno, bbsno, wname, subject, readcnt, regdt, indent");
            sql.append(" FROM tb_bbs ORDER by grpno DESC, ansnum ASC ");

            pstmt = con.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();
            if (rs.next()) {
                list = new ArrayList<>();
                do {
                    BbsDTO dto = new BbsDTO();
                    dto.setGrpno(rs.getInt(1));
                    dto.setBbsno(rs.getInt(2));
                    dto.setWname(rs.getString(3));
                    dto.setSubject(rs.getString(4));
                    dto.setReadcnt(rs.getInt(5));
                    dto.setRegdt(rs.getString(6));
                    dto.setIndent(rs.getInt(7));
                    list.add(dto);
                } while (rs.next());
                return list;
            } else {
                list = null;
            }

        } catch (Exception e) {
            System.out.println("추가실패" + e);

        } finally {
            DBClose.Close(con, pstmt, rs);
        }
        return list();
    }

    public int count() {
        int cnt = 0;
        try {
            con = dbopen.getConnection();
            sql = new StringBuilder();
            sql.append(" SELECT COUNT(*) as cnt FROM tb_bbs ");

            pstmt = con.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();
            if (rs.next()) {
                cnt = rs.getInt(1);
            } // end if
        } catch (Exception e) {
            System.out.println("추가실패" + e);
        } finally {
            DBClose.Close(con, pstmt, rs);
        } // end try
        return cnt;
    }// end count

    public BbsDTO read(int bbsno) {
        BbsDTO dto = null;
        try {
            con = dbopen.getConnection();
            sql = new StringBuilder();
            sql.append(
                    " SELECT bbsno, wname, subject, content, readcnt, regdt, ip, grpno, indent, ansnum FROM tb_bbs WHERE bbsno=? ");

            pstmt = con.prepareStatement(sql.toString());
            pstmt.setInt(1, bbsno);

            rs = pstmt.executeQuery();
            if (rs.next()) {
                dto = new BbsDTO();
                dto.setBbsno(rs.getInt("bbsno"));
                dto.setWname(rs.getString("wname"));
                dto.setSubject(rs.getString("subject"));
                dto.setContent(rs.getString("content"));
                dto.setReadcnt(rs.getInt("readcnt"));
                dto.setRegdt(rs.getString("regdt"));
                dto.setIp(rs.getString("ip"));
                dto.setGrpno(rs.getInt("grpno"));
                dto.setIndent(rs.getInt("indent"));
                dto.setAnsnum(rs.getInt("ansnum"));

            }
        } catch (Exception e) {
            System.out.println("추가실패" + e);
        } finally {
            DBClose.Close(con, pstmt, rs);
        }
        return dto;
    }// end read

    public void incrementCnt(int bbsno) {
        try {
            con = dbopen.getConnection();
            sql = new StringBuilder();
            sql.append(" UPDATE tb_bbs SET readcnt=readcnt+1 WHERE bbsno=? ");
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setInt(1, bbsno);
            pstmt.executeUpdate();

        } catch (Exception e) {
            System.out.println("추가실패" + e);
        } finally {
            DBClose.Close(con, pstmt);
        }

    }// incrementCnt end

    public int delete(BbsDTO dto) {
        int cnt = 0;
        try {
            con = dbopen.getConnection();
            sql = new StringBuilder();
            sql.append(" DELETE FROM tb_bbs WHERE bbsno=? AND passwd=? ");
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setInt(1, dto.getBbsno());
            pstmt.setString(2, dto.getPasswd());

            cnt = pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("추가실패" + e);
        } finally {
            DBClose.Close(con, pstmt);
        }
        return cnt;
    }// end delete

    public int update(BbsDTO dto) {
        int cnt = 0;
        try {
            con = dbopen.getConnection();
            sql = new StringBuilder();
            sql.append(" UPDATE tb_bbs SET subject=?, content=? ,wname=? " +
                    "WHERE bbsno=? AND passwd=? ");
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setString(1, dto.getSubject());
            pstmt.setString(2, dto.getContent());
            pstmt.setString(3, dto.getWname());
            pstmt.setInt(4, dto.getBbsno());
            pstmt.setString(5, dto.getPasswd());

            cnt = pstmt.executeUpdate();

        } catch (Exception e) {
            System.out.println("추가실패");
        } finally {
            DBClose.Close(con, pstmt);
        }
        return cnt;

    }

    public int reply(BbsDTO dto) {
        int cnt = 0;
        try {
            con = dbopen.getConnection();

            sql = new StringBuilder();
            // 1) 부모글 정보 가져오기
            int grpno = 0; // 그룹번호
            int indent = 0; // 들여쓰기
            int ansnum = 0; // 부모글 글순서
            sql.append("SELECT grpno, indent, ansnum " +
                    "FROM tb_bbs WHERE bbsno=? ");
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setInt(1, dto.getBbsno());

            rs = pstmt.executeQuery();
            if (rs.next()) {
                // 그룹번호 : 부모글 그룹번호 그대로 가져오기
                grpno = rs.getInt("grpno");
                indent = rs.getInt("indent") + 1;
                ansnum = rs.getInt("ansnum") + 1;

            } // end if
            // 2) 글순서 재정하기
            sql.delete(0, sql.length()); // 딜리트를해야 1단계가 초기화됨
            sql.append(" UPDATE tb_bbs" +
                    " SET ansnum=ansnum+1 " +
                    " WHERE grpno=? AND ansnum=? ");
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setInt(1, grpno);
            pstmt.setInt(2, ansnum);
            pstmt.executeUpdate();

            // 3) 답변글 추가하기
            sql.delete(0, sql.length()); // 딜리트를해야 1단계가 초기화됨
            sql.append(" INSERT INTO tb_bbs(bbsno, wname, subject, content, passwd, ip, grpno, indent, ansnum) ");
            sql.append(" VALUES (bbs_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?) ");

            pstmt = con.prepareStatement(sql.toString());
            pstmt.setString(1, dto.getWname());
            pstmt.setString(2, dto.getSubject());
            pstmt.setString(3, dto.getContent());
            pstmt.setString(4, dto.getPasswd());
            pstmt.setString(5, dto.getIp());
            pstmt.setInt(6, grpno);
            pstmt.setInt(7, indent);
            pstmt.setInt(8, ansnum);
            cnt = pstmt.executeUpdate();

        } catch (Exception e) {
            System.out.println("추가실패" + e);
        } finally {
            DBClose.Close(con, pstmt, rs);
        }
        return cnt;
    }// end reply

    public int count2(String col, String word) {
        int cnt = 0;
        try {
            con = dbopen.getConnection();

            sql = new StringBuilder();
            sql.append(" SELECT COUNT(*) as cnt ");
            sql.append(" FROM tb_bbs ");

            if (word.length() >= 1) { // 검색어가 존재한다면
                String search = "";
                if (col.equals("subject_content")) {
                    search += " WHERE subject LIKE '%" + word + "%' ";
                    search += " OR    content LIKE '%" + word + "%' ";
                } else if (col.equals("subject")) {
                    search += " WHERE subject LIKE '%" + word + "%' ";
                } else if (col.equals("content")) {
                    search += " WHERE content LIKE '%" + word + "%' ";
                } else if (col.equals("wname")) {
                    search += " WHERE wname LIKE '%" + word + "%' ";
                }// if end
                sql.append(search);
            }// if end

            pstmt = con.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();
            if (rs.next()) {
                cnt = rs.getInt("cnt");
            }// if end

        } catch (Exception e) {
            System.out.println("검색 글갯수 실패:" + e);
        } finally {
            DBClose.Close(con, pstmt, rs);
        }// end
        return cnt;
    }// ount2() end

    public ArrayList<BbsDTO> list2(String col, String word) {
        ArrayList<BbsDTO> list = null;
        try {
            con = dbopen.getConnection();

            sql = new StringBuilder();
            sql.append(" SELECT bbsno, wname, subject, readcnt, regdt, indent ");
            sql.append(" FROM tb_bbs ");

            if (word.length() >= 1) { //검색어가 존재한다면
                String search = "";
                if (col.equals("subject_content")) {
                    search += " WHERE subject LIKE '%" + word + "%'";
                    search += " OR    content LIKE '%" + word + "%'";
                } else if (col.equals("subject")) {
                    search += " WHERE subject LIKE '%" + word + "%'";
                } else if (col.equals("content")) {
                    search += " WHERE content LIKE '%" + word + "%'";
                } else if (col.equals("wname")) {
                    search += " WHERE wname LIKE '%" + word + "%'";
                }//if end
                sql.append(search);
            }//if end

            sql.append(" ORDER BY grpno DESC, ansnum ASC ");

            pstmt = con.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();
            if (rs.next()) {
                list = new ArrayList<>();
                do {
                    BbsDTO dto = new BbsDTO();//한줄담기
                    dto.setBbsno(rs.getInt("bbsno"));
                    dto.setWname(rs.getString("wname"));
                    dto.setSubject(rs.getString("subject"));
                    dto.setReadcnt(rs.getInt("readcnt"));
                    dto.setRegdt(rs.getString("regdt"));
                    dto.setIndent(rs.getInt("indent"));
                    list.add(dto); //list에 모으기
                } while (rs.next());
            }//if end

        } catch (Exception e) {
            System.out.println("전체목록실패:" + e);
        } finally {
            DBClose.Close(con, pstmt, rs);
        }//end
        return list;
    }//list2() end

    public ArrayList<BbsDTO> list3(String col, String word, int nowPage, int recordPerPage) {
        ArrayList<BbsDTO> list = null;
        //페이지당 출력할 행의 갯수(10개를 기준)
        //1페이지 : WH
        int startRow = ((nowPage-1) * recordPerPage) + 1 ;
        int endRow   = nowPage * recordPerPage;
        try {
            con = dbopen.getConnection();
            sql = new StringBuilder();

            word = word.trim(); //검색어 좌우 공백 제거


            if(word.length()==0) { //검색하지 않는 경우 -> 6)
                sql.append(" SELECT * ");
                sql.append(" FROM ( ");
                sql.append("       SELECT bbsno, subject, wname, readcnt, indent, regdt, rownum as r ");
                sql.append("       FROM ( ");
                sql.append("             SELECT bbsno, subject, wname, readcnt, indent, regdt ");
                sql.append("             FROM tb_bbs ");
                sql.append("             ORDER BY grpno DESC, ansnum ASC ");
                sql.append("          ) ");
                sql.append("       ) ");
                sql.append(" WHERE r>=" + startRow + " AND r<=" + endRow);
            } else { //검색하는 경우 -> 7)
                sql.append(" SELECT * ");
                sql.append(" FROM ( ");
                sql.append("       SELECT bbsno, subject, wname, readcnt, indent, regdt, rownum as r ");
                sql.append("       FROM ( ");
                sql.append("             SELECT bbsno, subject, wname, readcnt, indent, regdt ");
                sql.append("             FROM tb_bbs ");

                String search = "";
                if(col.equals("subject_content")) {
                    search += " WHERE subject LIKE '%" + word + "%' ";
                    search += " OR content LIKE '%" + word + "%' ";
                } else if(col.equals("subject")) {
                    search += " WHERE subject LIKE '%" + word + "%' ";
                } else if(col.equals("content")) {
                    search += " WHERE content LIKE '%" + word + "%' ";
                } else if(col.equals("wname")) {
                    search += " WHERE wname LIKE '%" + word + "%' ";
                }//if end
                sql.append(search);

                sql.append("             ORDER BY grpno DESC, ansnum ASC ");
                sql.append("          ) ");
                sql.append("       ) ");
                sql.append(" WHERE r>=" + startRow + " AND r<=" + endRow);
            }//if end


            pstmt = con.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();
            if (rs.next()) {
                list = new ArrayList<>();
                do {
                    BbsDTO dto = new BbsDTO();//한줄담기
                    dto.setBbsno(rs.getInt("bbsno"));
                    dto.setWname(rs.getString("wname"));
                    dto.setSubject(rs.getString("subject"));
                    dto.setReadcnt(rs.getInt("readcnt"));
                    dto.setRegdt(rs.getString("regdt"));
                    dto.setIndent(rs.getInt("indent"));
                    list.add(dto); //list에 모으기
                } while (rs.next());
            }//if end

        } catch (Exception e) {
            System.out.println("전체목록실패:" + e);
        } finally {
            DBClose.Close(con, pstmt, rs);
        }//end
        return list;
    }//list3() end
}



