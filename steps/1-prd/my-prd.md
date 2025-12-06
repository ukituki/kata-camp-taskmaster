# Product Requirements Document (PRD)

## 1. Project Overview

### Project Name
ZooCRM

### Tagline
A modern Customer Relationship Management system designed specifically for zoos to manage visitors, memberships, and animal care records.

### Problem Statement
Zoos face unique challenges in managing their operations:
- **Visitor Management**: Tracking daily visitors, group tours, and special events
- **Membership Management**: Managing annual memberships, renewals, and member benefits
- **Animal Care Records**: Maintaining health records, feeding schedules, and veterinary visits
- **Event Coordination**: Organizing educational programs, animal encounters, and fundraising events
- **Communication**: Keeping in touch with members, donors, and volunteers

Currently, many zoos use generic CRM systems or spreadsheets, which don't address their specific needs. They need a specialized solution that understands zoo operations and can handle the unique relationships between visitors, members, animals, and staff.

### Target Users
- **Zoo Administrators**: Staff who manage daily operations, memberships, and visitor services
- **Zoo Keepers**: Animal care staff who need to track animal health and care schedules
- **Visitor Services Staff**: Front-line staff who interact with visitors and process memberships
- **Event Coordinators**: Staff who organize educational programs and special events

### Value Proposition
ZooCRM provides a purpose-built solution that:
- Streamlines visitor and membership management with zoo-specific workflows
- Centralizes animal care records for better health monitoring
- Improves communication with members and visitors through automated notifications
- Simplifies event management and coordination
- Provides insights through reporting on visitor patterns, membership trends, and animal care metrics

---

## 2. Goals and Objectives

### Primary Goals
- Create a functional CRM system that handles core zoo operations (visitors, memberships, animals)
- Provide an intuitive interface that zoo staff can use without extensive training
- Enable data tracking and basic reporting for operational insights
- Support mobile-friendly access for staff working in different areas of the zoo

### Success Metrics
- **User Adoption**: At least 80% of target users can complete core tasks without training
- **Data Completeness**: 90% of daily visitors and memberships are recorded within 24 hours
- **Performance**: Page load times under 2 seconds for all core views
- **Reliability**: System uptime of 99% during operating hours (9 AM - 6 PM)

### Business Objectives (if applicable)
- Reduce time spent on administrative tasks by 30%
- Improve membership renewal rates through better tracking and communication
- Enable data-driven decisions about visitor programs and animal care

---

## 3. User Stories

- As a **Zoo Administrator**, I want to view a dashboard with today's visitor count and upcoming events, so that I can quickly understand the day's operations
- As a **Visitor Services Staff**, I want to quickly add a new visitor entry with their contact information, so that we can track attendance and follow up with marketing
- As a **Visitor Services Staff**, I want to process a new membership application, so that members can immediately access member benefits
- As a **Zoo Administrator**, I want to view all members whose memberships expire in the next 30 days, so that I can send renewal reminders
- As a **Zoo Keeper**, I want to log a feeding schedule for an animal, so that we maintain consistent care records
- As a **Zoo Keeper**, I want to record a veterinary visit for an animal, so that we have a complete health history
- As a **Event Coordinator**, I want to create an event and link it to registered participants, so that we can track attendance and send reminders
- As a **Zoo Administrator**, I want to search for a visitor or member by name or email, so that I can quickly find their information
- As a **Zoo Administrator**, I want to view a report of monthly visitor statistics, so that I can analyze trends and plan accordingly
- As a **Visitor Services Staff**, I want to mark a visitor as a repeat visitor, so that we can identify our most engaged guests

---

## 4. Features and Requirements

### Feature 1: Visitor Management

**Description:**
Core functionality to track and manage zoo visitors. Staff can add new visitors, view visitor history, and search for existing visitors.

**User Value:**
Enables zoo staff to maintain a database of visitors for marketing, follow-up communications, and understanding visitor patterns.

**Functional Requirements:**
- Add new visitor with: name, email, phone (optional), visit date, group size, notes
- View list of all visitors with search and filter capabilities
- View individual visitor details and visit history
- Mark visitors as repeat visitors
- Edit visitor information
- Delete visitor records (with confirmation)

**Non-Functional Requirements:**
- Search should return results in under 500ms
- Support for at least 10,000 visitor records
- Responsive design for tablet use in visitor services areas

**Acceptance Criteria:**
- [ ] Staff can create a new visitor entry in under 30 seconds
- [ ] Search by name or email returns relevant results
- [ ] Visitor list displays paginated results (20 per page)
- [ ] All visitor data is saved and persists after page refresh
- [ ] Form validation prevents invalid data entry

**Edge Cases:**
- Visitor with same name as existing visitor: Show duplicate warning but allow creation
- Very long names or notes: Truncate in list view, show full in detail view
- Special characters in names: Handle Unicode characters properly

**Error Handling:**
- Network error: Show user-friendly message and allow retry
- Validation error: Highlight invalid fields with clear error messages
- Server error: Log error and show generic "Something went wrong" message

---

### Feature 2: Membership Management

**Description:**
Complete membership lifecycle management including new applications, renewals, expiration tracking, and member benefits.

**User Value:**
Streamlines membership operations, reduces administrative overhead, and helps maintain member relationships through automated tracking.

**Functional Requirements:**
- Create new membership with: member name, email, phone, membership type (Individual, Family, Premium), start date, expiration date
- View all memberships with filters (active, expired, expiring soon)
- View memberships expiring in next 30/60/90 days
- Renew an existing membership (extend expiration date)
- Cancel/expire a membership
- View membership history for a member
- Link membership to existing visitor record or create new

**Non-Functional Requirements:**
- Membership list should load in under 1 second
- Support for at least 5,000 active memberships
- Automatic calculation of expiration dates based on membership type

**Acceptance Criteria:**
- [ ] Staff can create a new membership in under 1 minute
- [ ] Expiration date is automatically calculated (1 year from start date)
- [ ] Filter for "expiring soon" shows memberships expiring in next 30 days
- [ ] Renewal extends membership by 1 year from current expiration date
- [ ] Membership status (active/expired) is clearly displayed

**Edge Cases:**
- Membership starting on leap year date: Handle February 29 correctly
- Renewal before expiration: Extend from current expiration, not from today
- Multiple memberships for same person: Allow but show warning

**Error Handling:**
- Invalid date range: Show error if expiration is before start date
- Duplicate membership: Warn if creating membership for existing active member
- Past expiration date: Allow but mark as expired immediately

---

### Feature 3: Animal Care Records

**Description:**
Track animal information, feeding schedules, and veterinary visits to maintain comprehensive care records.

**User Value:**
Ensures consistent animal care, maintains health records for regulatory compliance, and helps coordinate care schedules among staff.

**Functional Requirements:**
- Add new animal with: name, species, enclosure/habitat, date of arrival, health status, notes
- View list of all animals with search and filter by species or habitat
- View individual animal details and care history
- Log feeding entry: date, time, food type, quantity, keeper name, notes
- Log veterinary visit: date, veterinarian name, reason, diagnosis, treatment, follow-up required, notes
- View feeding schedule and history for an animal
- View veterinary history for an animal
- Edit animal information
- Archive/deactivate animal (for animals that have left the zoo)

**Non-Functional Requirements:**
- Support for at least 500 animals
- Care records should be searchable by date range
- Data entry forms should be quick to complete (under 2 minutes)

**Acceptance Criteria:**
- [ ] Staff can add a new animal in under 2 minutes
- [ ] Feeding entries are displayed in chronological order (newest first)
- [ ] Veterinary visits are displayed in chronological order with most recent highlighted
- [ ] Search by species or name returns relevant results
- [ ] All care records are timestamped and include staff member name

**Edge Cases:**
- Multiple animals with same name: Allow but show species/habitat to distinguish
- Feeding entry for past date: Allow for backdating with note requirement
- Very long notes: Support multi-line text with proper display

**Error Handling:**
- Missing required fields: Show clear validation errors
- Invalid date/time: Prevent future dates for feeding/vet visits
- Duplicate entry: Warn if creating duplicate feeding entry for same time

---

### Feature 4: Dashboard and Overview

**Description:**
Central dashboard providing at-a-glance view of key metrics and recent activity for quick operational awareness.

**User Value:**
Gives staff immediate insight into daily operations without navigating multiple screens, enabling faster decision-making.

**Functional Requirements:**
- Display today's visitor count
- Show visitors from last 7 days (chart or list)
- Display upcoming events (next 7 days)
- Show memberships expiring in next 30 days (count and list)
- Display recent animal care activities (last 5 feedings/vet visits)
- Quick action buttons: Add Visitor, Add Membership, Add Animal, Log Feeding
- Link to detailed views for each section

**Non-Functional Requirements:**
- Dashboard should load in under 1.5 seconds
- Data should refresh automatically or have manual refresh button
- Responsive layout for desktop and tablet

**Acceptance Criteria:**
- [ ] Dashboard displays accurate counts for current day
- [ ] All metrics are clickable and navigate to relevant detail pages
- [ ] Quick actions are easily accessible and functional
- [ ] Dashboard is the default landing page after login
- [ ] Data updates reflect recent changes within 30 seconds

**Edge Cases:**
- No visitors today: Show "0" with friendly message
- No upcoming events: Show "No upcoming events" message
- Very high visitor count: Format numbers appropriately (e.g., "1.2K")

**Error Handling:**
- Data loading error: Show partial data with error indicator
- Stale data: Show last updated timestamp

---

### Feature 5: Search and Navigation

**Description:**
Global search functionality and intuitive navigation to help staff quickly find information across all modules.

**User Value:**
Reduces time spent looking for information, improving efficiency and user experience.

**Functional Requirements:**
- Global search bar in header that searches across visitors, members, and animals
- Search results grouped by type (Visitors, Members, Animals)
- Click result to navigate to detail page
- Navigation menu with clear sections: Dashboard, Visitors, Memberships, Animals, Events
- Breadcrumb navigation on detail pages
- Back button functionality

**Non-Functional Requirements:**
- Search results should appear within 500ms
- Support partial matches and fuzzy search
- Search should work across name, email, and phone fields

**Acceptance Criteria:**
- [ ] Search returns results from all three main entities
- [ ] Results are clearly labeled by type
- [ ] Clicking a result navigates to correct detail page
- [ ] Navigation menu is always accessible
- [ ] Current page is highlighted in navigation

**Edge Cases:**
- No search results: Show "No results found" with search tips
- Very common search term: Limit results to top 20 per category
- Special characters in search: Handle properly

**Error Handling:**
- Search timeout: Show error and allow retry
- Empty search: Show helpful placeholder text

---

## 5. Technical Requirements

### Technology Stack
- **Frontend:** React 18+ with TypeScript
- **Styling:** Tailwind CSS for utility-first styling
- **State Management:** React Context API or Zustand for global state
- **Routing:** React Router v6
- **Forms:** React Hook Form with Zod validation
- **HTTP Client:** Axios or Fetch API
- **Build Tool:** Vite for fast development and builds
- **Backend:** Node.js with Express (or Next.js API routes)
- **Database:** SQLite for MVP (easy setup, file-based) or PostgreSQL
- **ORM:** Prisma or Drizzle ORM
- **Authentication:** Simple session-based auth or JWT (for MVP, can be basic)

### Architecture
- **Frontend:** Single Page Application (SPA) with component-based architecture
- **Backend:** RESTful API with clear separation of concerns
- **Database:** Relational database with proper schema design
- **File Structure:**
  ```
  /src
    /components (reusable UI components)
    /pages (page components)
    /hooks (custom React hooks)
    /services (API calls)
    /utils (helper functions)
    /types (TypeScript types)
  ```

### Integration Requirements
- No external API integrations required for MVP
- Future: Email service integration for notifications (SendGrid, Mailgun)
- Future: Payment processing for membership renewals (Stripe)

### Performance Requirements
- Initial page load: Under 3 seconds
- Page transitions: Under 500ms
- API response times: Under 500ms for standard queries
- Support for 10,000+ visitor records without performance degradation
- Lazy loading for large lists (pagination or virtual scrolling)

### Security Considerations
- Input validation on both client and server
- SQL injection prevention through parameterized queries (ORM handles this)
- XSS prevention through React's built-in escaping
- Basic authentication required for all routes
- Sensitive data (emails, phone numbers) should be handled responsibly
- HTTPS in production

### Browser/Device Compatibility
- **Desktop:** Chrome, Firefox, Safari, Edge (latest 2 versions)
- **Tablet:** iPad, Android tablets (for staff use in zoo)
- **Mobile:** Responsive design, but mobile is secondary priority
- **Screen Sizes:** Minimum 1024px width for optimal experience, graceful degradation below

---

## 6. Design Considerations

### UI/UX Principles
- **Simplicity First:** Clean, uncluttered interface that doesn't overwhelm zoo staff
- **Efficiency:** Common tasks should be accessible in 2-3 clicks
- **Consistency:** Uniform design patterns across all pages
- **Accessibility:** WCAG 2.1 Level AA compliance where possible
- **Visual Hierarchy:** Important information and actions are prominent

### Responsive Design
- **Desktop (1024px+):** Full-featured layout with sidebar navigation, multi-column layouts
- **Tablet (768px - 1023px):** Adapted layout with collapsible sidebar, optimized forms
- **Mobile (< 768px):** Stacked layouts, bottom navigation, simplified forms (secondary priority)

### Accessibility
- Semantic HTML elements
- ARIA labels for interactive elements
- Keyboard navigation support
- Sufficient color contrast (4.5:1 for text)
- Focus indicators on interactive elements
- Alt text for images (if any)

### Key User Flows
1. **Add New Visitor:**
   - Click "Add Visitor" from dashboard or navigation
   - Fill out visitor form (name, email, phone, visit date, group size)
   - Submit form
   - See success message and option to add another or view visitor

2. **Process Membership:**
   - Navigate to Memberships
   - Click "New Membership"
   - Search for existing visitor or create new
   - Select membership type
   - Confirm dates (auto-calculated)
   - Submit and view confirmation

3. **Log Animal Feeding:**
   - Navigate to Animals
   - Select animal from list
   - Click "Log Feeding"
   - Fill out feeding form (date, time, food, quantity, notes)
   - Submit
   - See updated feeding history

4. **Search for Information:**
   - Type in global search bar
   - View grouped results
   - Click on desired result
   - Navigate to detail page

---

## 7. Success Criteria

### Measurable Outcomes
- **Functionality:** All 5 core features (Visitors, Memberships, Animals, Dashboard, Search) are fully implemented and working
- **Usability:** Target users can complete primary tasks (add visitor, create membership, log feeding) without training documentation
- **Performance:** All pages load in under 2 seconds, search returns results in under 500ms
- **Data Integrity:** All CRUD operations work correctly, data persists reliably
- **Responsiveness:** Application works well on desktop and tablet devices

### Launch Criteria
- [ ] All core features implemented and tested
- [ ] No critical bugs in primary user flows
- [ ] Basic error handling in place
- [ ] Data validation working correctly
- [ ] Responsive design functional on target devices
- [ ] Basic documentation for setup and usage

### Quality Standards
- **Code Quality:** TypeScript with proper types, no `any` types in critical paths
- **Testing:** Manual testing of all user flows, basic error scenarios covered
- **Documentation:** README with setup instructions, basic API documentation
- **User Experience:** Intuitive navigation, clear error messages, helpful feedback

---

## 8. Risks and Mitigations

### Technical Risks
- **Risk:** Database performance with large datasets (10,000+ records)
  - **Mitigation:** Implement pagination from the start, use database indexes on frequently searched fields, consider query optimization

- **Risk:** Complex state management leading to bugs
  - **Mitigation:** Keep state management simple (Context API or Zustand), avoid over-engineering, test state changes thoroughly

- **Risk:** Time constraints preventing completion of all features
  - **Mitigation:** Prioritize core features (Visitors, Memberships, Dashboard), make Animals feature simpler if needed, cut nice-to-have features

### User Adoption Risks
- **Risk:** Staff find the system difficult to use
  - **Mitigation:** Keep UI simple and intuitive, get feedback early, provide clear labels and helpful placeholders

- **Risk:** Data entry is too time-consuming
  - **Mitigation:** Minimize required fields, provide smart defaults, allow bulk operations where possible

### Timeline Risks
- **Risk:** Underestimating development time
  - **Mitigation:** Break features into smaller tasks, focus on MVP scope, be ready to cut non-essential features

- **Risk:** Getting stuck on technical challenges
  - **Mitigation:** Use proven technologies, leverage existing libraries, ask for help early, have fallback approaches

---

## 9. Timeline and Milestones (Optional)

### Phase 1: Foundation (Days 1-3)
- Set up project structure (frontend + backend)
- Configure database and ORM
- Implement authentication (basic)
- Create basic navigation and layout
- Build Dashboard shell

### Phase 2: Core Features - Visitors (Days 4-5)
- Implement Visitor Management (CRUD)
- Create visitor list and detail views
- Add search functionality for visitors
- Test visitor workflows

### Phase 3: Core Features - Memberships (Days 6-7)
- Implement Membership Management (CRUD)
- Add expiration tracking and filtering
- Link memberships to visitors
- Test membership workflows

### Phase 4: Animal Care (Days 8-9)
- Implement Animal Management (CRUD)
- Add feeding log functionality
- Add veterinary visit logging
- Test animal care workflows

### Phase 5: Polish and Testing (Days 10-14)
- Complete Dashboard with real data
- Implement global search
- Add error handling and validation
- Responsive design adjustments
- Testing and bug fixes
- Documentation

---

## 10. Future Enhancements (Optional)

- **Event Management:** Full event creation, participant registration, and attendance tracking
- **Email Notifications:** Automated emails for membership renewals, event reminders, animal care schedules
- **Reporting and Analytics:** Advanced reports on visitor trends, membership analytics, animal care statistics
- **Mobile App:** Native mobile app for zoo keepers to log feedings on-the-go
- **Payment Integration:** Online membership renewals and payments
- **Volunteer Management:** Track volunteers, schedules, and assignments
- **Donor Management:** Track donations and donor relationships
- **Multi-location Support:** Support for zoos with multiple locations or facilities
- **Export Functionality:** Export data to CSV/Excel for external analysis
- **Advanced Search:** Filtering by multiple criteria, saved searches
- **Calendar Integration:** Sync events and care schedules with external calendars
- **Photo Management:** Attach photos to animals, events, or visitor records

---

## Notes

- This PRD is scoped for a 1-2 week solo development project
- Focus is on core functionality that provides immediate value
- Technical choices prioritize speed of development and ease of maintenance
- Database choice (SQLite vs PostgreSQL) depends on deployment strategy
- Authentication can be simplified for MVP (single admin user or basic session auth)
- Animal care records are simplified - full veterinary record system would be more complex
- Event management is mentioned but not fully detailed - can be Phase 2 feature
- Consider using a UI component library (shadcn/ui, Chakra UI) to speed up development
- Form validation should be comprehensive but user-friendly
- Consider adding data export early if stakeholders need it

---

## References

- [React Documentation](https://react.dev/)
- [Tailwind CSS Documentation](https://tailwindcss.com/)
- [Prisma Documentation](https://www.prisma.io/docs)
- [React Hook Form](https://react-hook-form.com/)
- Zoo management best practices (research as needed)

