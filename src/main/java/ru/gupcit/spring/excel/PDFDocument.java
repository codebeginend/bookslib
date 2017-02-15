package ru.gupcit.spring.excel;

import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import org.springframework.web.servlet.view.document.AbstractPdfView;
import ru.gupcit.spring.model.Books;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * Created by zaur on 30.01.17.
 */
public class PDFDocument extends AbstractPdfView {

    @Override
    protected void buildPdfDocument(
            Map<String, Object> model,
            Document document,
            PdfWriter writer,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {


        PdfPTable table = new PdfPTable(4);
        PdfPCell header1 = new PdfPCell(new Phrase("Name"));
        PdfPCell header2 = new PdfPCell(new Phrase("Weight"));
        PdfPCell header3 = new PdfPCell(new Phrase("Color"));
        PdfPCell header4 = new PdfPCell(new Phrase("Org"));
        header1.setHorizontalAlignment(Element.ALIGN_LEFT);
        header2.setHorizontalAlignment(Element.ALIGN_LEFT);
        header3.setHorizontalAlignment(Element.ALIGN_LEFT);
        header4.setHorizontalAlignment(Element.ALIGN_LEFT);
        table.addCell(header1);
        table.addCell(header2);
        table.addCell(header3);
        table.addCell(header4);

        //Get data from model
        List<Books> applicationsList = (List<Books>) model.get("modelObject");
        for (Books applications : applicationsList) {
            table.addCell(applications.getTitle());
            table.addCell(applications.getText());
            table.addCell(applications.getText());
            table.addCell(applications.getText());
        }
        document.add(table);
    }
}
