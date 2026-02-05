# Presentation Checklist

Quick reference for creating and reviewing architecture presentations.

---

## AI Agent Delivery Checklist

**MUST complete all steps when creating a presentation:**

- [ ] **Dependencies**: Marp CLI installed (`npm install -g @marp-team/marp-cli`)
- [ ] **Markdown**: Presentation file created with Marp front matter
- [ ] **Export**: Converted to PPTX (default) or requested format
- [ ] **Deliver**: File path reported to user

```bash
# Required export step
marp {slides.md} --pptx -o {slides.pptx}
```

---

## Pre-Presentation Checklist

### Planning

- [ ] Purpose clearly defined
- [ ] Target audience identified
- [ ] Key messages determined (max 3)
- [ ] Time allocation known
- [ ] Decision/action requested identified

### Content Preparation

- [ ] Relevant source materials gathered
- [ ] Architecture diagrams available
- [ ] Data/metrics collected
- [ ] Risks and mitigations documented
- [ ] Timeline/roadmap prepared

---

## Slide Content Checklist

### Title Slide

- [ ] Clear, descriptive title
- [ ] Subtitle provides context
- [ ] Date included
- [ ] Author/presenter name

### Every Slide

- [ ] One main message per slide
- [ ] Maximum 6 bullet points
- [ ] Text readable at presentation size
- [ ] Consistent terminology
- [ ] Speaker notes for complex content

### Diagrams

- [ ] Diagrams exported at high resolution
- [ ] Labels readable when projected
- [ ] Color-blind friendly colors
- [ ] Legend included if needed
- [ ] Consistent styling across diagrams

### Tables

- [ ] Headers clear and descriptive
- [ ] Data aligned appropriately
- [ ] Not more than 6-7 rows
- [ ] Key data highlighted

### Code Blocks

- [ ] Syntax highlighting enabled
- [ ] Font size readable
- [ ] Only essential code shown
- [ ] Comments explain non-obvious parts

---

## Visual Design Checklist

### Typography

- [ ] Consistent heading hierarchy
- [ ] Font sizes appropriate (min 24pt)
- [ ] Limited font variations
- [ ] Adequate line spacing

### Layout

- [ ] Consistent margins
- [ ] Balanced visual weight
- [ ] Whitespace used effectively
- [ ] Alignment consistent

### Images

- [ ] High resolution (no pixelation)
- [ ] Appropriate size (not too small)
- [ ] Positioned consistently
- [ ] Alt text/speaker notes describe content

### Color

- [ ] Theme colors used consistently
- [ ] Sufficient contrast for readability
- [ ] Meaning conveyed beyond color alone
- [ ] Brand colors if required

---

## Technical Checklist

### Marp Setup

- [ ] `marp: true` in front matter
- [ ] Theme specified
- [ ] Pagination enabled if needed
- [ ] Header/footer configured

### Files

- [ ] All images referenced exist
- [ ] Relative paths used for images
- [ ] No broken links
- [ ] Diagrams in supported format (PNG/SVG)

### Export Verification

- [ ] HTML preview renders correctly
- [ ] PPTX opens without errors
- [ ] PDF generated successfully
- [ ] Images visible in exports
- [ ] Page numbers correct

---

## Review Checklist

### Content Review

- [ ] Logical flow between slides
- [ ] Story/narrative is clear
- [ ] Appropriate depth for audience
- [ ] Accurate technical content
- [ ] No contradictions
- [ ] Sources cited where needed

### Audience Fit

- [ ] Language appropriate for audience
- [ ] Acronyms explained
- [ ] Assumed knowledge reasonable
- [ ] Actionable next steps included

### Time Check

- [ ] Estimated duration fits allocation
- [ ] ~1-2 minutes per content slide
- [ ] Time for Q&A included
- [ ] Sections can be skipped if needed

---

## Pre-Delivery Checklist

### Practice

- [ ] Run through once solo
- [ ] Transitions smooth
- [ ] Speaker notes reviewed
- [ ] Timing practiced

### Technical Setup

- [ ] Presentation tested on target machine
- [ ] Backup copy available (USB/cloud)
- [ ] Export format works (PPTX/PDF)
- [ ] Screen sharing tested (if remote)

### Materials

- [ ] Handouts prepared (if needed)
- [ ] Links to documentation ready
- [ ] Contact information on final slide

---

## Post-Presentation Checklist

### Archive

- [ ] Final version committed to git
- [ ] Exports stored in `exports/` folder
- [ ] Feedback incorporated

### Follow-up

- [ ] Slides shared with attendees
- [ ] Action items documented
- [ ] Decisions recorded
- [ ] Questions answered

---

## Quick Reference: Common Issues

| Issue | Solution |
|-------|----------|
| Images not showing | Check relative paths, ensure files exist |
| PPTX too large | Compress images before embedding |
| Text too small | Use min 24pt, reduce content per slide |
| Slides too busy | Split into multiple slides |
| Export fails | Check marp-cli version, try HTML first |
| Theme not applied | Verify theme path, check CSS syntax |
| Pagination wrong | Check `paginate: true` in front matter |
| Speaker notes missing | Export with `--notes` option |

---

## Slide Count Guidelines

| Duration | Content Slides | Total (with title/Q&A) |
|----------|----------------|------------------------|
| 5 min | 3-4 | 5-6 |
| 10 min | 6-8 | 8-10 |
| 15 min | 10-12 | 12-15 |
| 30 min | 20-25 | 25-30 |
| 45 min | 30-35 | 35-40 |
| 60 min | 40-50 | 45-55 |

Rule of thumb: 1-2 minutes per slide (content slides).

---

## Export Commands Quick Reference

```bash
# Preview with live reload
marp -w -p slides.md

# Export to PDF
marp slides.md --pdf -o slides.pdf

# Export to PPTX
marp slides.md --pptx -o slides.pptx

# Export to HTML
marp slides.md -o slides.html

# Export with custom theme
marp slides.md --theme ./themes/architecture.css -o slides.pptx

# Export slide images
marp slides.md --images png -o ./images/
```
